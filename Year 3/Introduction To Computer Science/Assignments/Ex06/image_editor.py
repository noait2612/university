#################################################################
# FILE : image_editor.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex6 2025
# DESCRIPTION: A simple program that edits images
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: moodle (ex video tutorial), w3schools, docs.python.org
# NOTES: ...
#################################################################
##############################################################################
#                                   Imports                                  #
##############################################################################
import PIL
import math
import sys

from Assignments.Ex06 import ex6_helper
from Assignments.Ex06.ex6_helper import *


##############################################################################
#                                  Functions                                 #
##############################################################################


# We can assume we get a valid image.
def separate_channels(image: ColoredImage) -> List[SingleChannelImage]:
    channels_count, rows_length, columns_length = extract_matrix_metadata(image)

    channels = []
    for channel_index in range(channels_count):
        channel = []
        for row_index in range(rows_length):
            row_data = []
            for column_index in range(columns_length):
                row_data.append(image[row_index][column_index][channel_index])
            channel.append(row_data)
        channels.append(channel)

    return channels


def combine_channels(channels: List[SingleChannelImage]) -> ColoredImage:
    channels_count, rows_length, columns_length = extract_matrix_metadata(channels)
    image_matrix = []
    for row_index in range(rows_length):
        row_data = []
        for column_index in range(columns_length):
            pixel = []
            for channel_index in range(channels_count):
                pixel.append(channels[channel_index][row_index][column_index])
            row_data.append(pixel)
        image_matrix.append(row_data)

    return image_matrix


# We can assume we get a valid pixel.
def RGB2grayscale(colored_image: ColoredImage) -> SingleChannelImage:
    rows_length = len(colored_image)
    columns_length = len(colored_image[0])
    grayscale_image = []
    for row_index in range(rows_length):
        grayscale_row = []
        for column_index in range(columns_length):
            pixel = colored_image[row_index][column_index]
            grayscale_row.append(round((pixel[0] * 0.299) + (pixel[1] * 0.587) + (pixel[2] * 0.114)))
        grayscale_image.append(grayscale_row)

    return grayscale_image


# We assume size is in ZZ^(plus) and an odd number.
def blur_kernel(size: int) -> Kernel:
    kernel_value = 1.0 / (size ** 2)
    kernel = []
    for _ in range(size):
        kernel.append([kernel_value] * size)

    return kernel


def apply_kernel(image: SingleChannelImage, kernel: Kernel) -> SingleChannelImage:
    rows_length = len(image)
    columns_length = len(image[0])
    kernel_size = len(kernel)

    # We assume always that kernel_size is position, integer (ZZ ring) and even number.
    kernel_radius = kernel_size // 2

    kernel_transformation_result = []
    for row_index in range(rows_length):
        transformed_row = []
        for column_index in range(columns_length):
            pixel_value = 0
            for kernel_row_index in range(kernel_size):
                for kernel_column_index in range(len(kernel[0])):
                    current_kernel_row = row_index + kernel_row_index - kernel_radius
                    current_kernel_column = column_index + kernel_column_index - kernel_radius
                    kernel_value = kernel[kernel_row_index][kernel_column_index]
                    if current_kernel_row < 0 or current_kernel_column < 0 or current_kernel_row >= rows_length or current_kernel_column >= columns_length:
                        pixel_value += kernel_value * image[row_index][column_index]
                    else:
                        pixel_value += kernel_value * image[current_kernel_row][current_kernel_column]
            transformed_row.append(max(0, min(255, round(pixel_value))))
        kernel_transformation_result.append(transformed_row)

    return kernel_transformation_result


# We assume the image is valid and x,y doesn't have to be integers.
def bilinear_interpolation(image: SingleChannelImage, y: float, x: float) -> int:
    top_left = (math.floor(y), math.floor(x))
    top_right = (math.floor(y), math.ceil(x))
    bottom_left = (math.ceil(y), math.floor(x))
    bottom_right = (math.ceil(y), math.ceil(x))

    # y is for the length of image and x for width of image.
    x_coordinate = 1
    y_coordinate = 0

    delta_x = x - top_left[x_coordinate]
    delta_y = y - top_left[y_coordinate]

    a_pixel = image[top_left[y_coordinate]][top_left[x_coordinate]]
    b_pixel = image[bottom_left[y_coordinate]][bottom_left[x_coordinate]]
    c_pixel = image[top_right[y_coordinate]][top_right[x_coordinate]]
    d_pixel = image[bottom_right[y_coordinate]][bottom_right[x_coordinate]]

    # The expression for the ex page.
    pixel_value = a_pixel * (1 - delta_x) * (1 - delta_y) + b_pixel * delta_y * (1 - delta_x) + c_pixel * delta_x * (
            1 - delta_y) + d_pixel * delta_x * delta_y

    return round(pixel_value)


def resize(image: SingleChannelImage, new_height: int, new_width: int) -> SingleChannelImage:
    origin_image_height = len(image)
    origin_image_width = len(image[0])
    resized_image = []

    for row_index in range(new_height):
        resized_row = []
        for column_index in range(new_width):
            # If and elif's are for the boundary points (boundary point goes to boundary point)
            if row_index == 0 and column_index == 0:
                resized_pixel = image[row_index][column_index]
            elif row_index == (new_height - 1) and column_index == 0:
                resized_pixel = image[origin_image_height - 1][column_index]
            elif row_index == 0 and column_index == (new_width - 1):
                resized_pixel = image[row_index][origin_image_width - 1]
            elif row_index == (new_height - 1) and column_index == (new_width - 1):
                resized_pixel = image[origin_image_height - 1][origin_image_width - 1]
            else:
                new_y_coordinate = row_index / ((new_height - 1) * (origin_image_height - 1))
                new_x_coordinate = column_index / ((new_width - 1) * (origin_image_width - 1))
                resized_pixel = bilinear_interpolation(image, new_y_coordinate, new_x_coordinate)

            resized_row.append(resized_pixel)
        resized_image.append(resized_row)

    return resized_image


#We assume direction in {'L', 'R'} only.
def rotate_90(image: Image, direction: str) -> Image:
    if direction == "L":
        # If we rotate to left, we need to move backwards on columns indices.
        is_backward_on_columns = True
    elif direction == "R":
        is_backward_on_columns = False

    return inner_rotate_90(image, is_backward_on_columns)


# Get the image and support is_backward_on_columns and otherwise doing backward_on_rows.
def inner_rotate_90(image: Image, is_backward_on_columns: bool) -> Image:
    rotated_image = []

    # This if condition is for writing only one loop and not twice.
    if is_backward_on_columns:
        column_start_index = len(image[0]) - 1
        column_stop_index = -1
        column_step = -1
        row_stop_index = len(image)
        row_start_index = 0
        row_step = 1
    else:
        column_start_index = 0
        column_stop_index = len(image[0])
        column_step = 1
        row_stop_index = -1
        row_start_index = len(image) - 1
        row_step = -1

    for column_index in range(column_start_index, column_stop_index, column_step):
        rotate_row = []
        for row_index in range(row_start_index, row_stop_index, row_step):
            rotate_row.append(image[row_index][column_index])
        rotated_image.append(rotate_row)

    return rotated_image


def get_edges(image: SingleChannelImage, blur_size: int, block_size: int, c: float) -> SingleChannelImage:
    image_edges = []
    blured_image = apply_kernel(image, blur_kernel(blur_size))
    threshold_matrix = get_threshold_matrix(image, blured_image, block_size, c)

    for row_index in range(len(image)):
        row_edge = []
        for column_index in range(len(image[row_index])):
            if blured_image[row_index][column_index] < threshold_matrix[row_index][column_index]:
                edge_value = 0
            else:
                edge_value = 255
            row_edge.append(edge_value)
        image_edges.append(row_edge)

    return image_edges


def quantize(image: SingleChannelImage, N: int) -> SingleChannelImage:
    quantize_image = []
    for row_index in range(len(image)):
        quantize_row = []
        for column_index in range(len(image[0])):
            quantize_row.append(round(math.floor(image[row_index][column_index] * (N / 256)) * (255 / (N - 1))))
        quantize_image.append(quantize_row)

    return quantize_image


def get_threshold_matrix(image, blurred_image, block_size, c):
    average_blurred_image = apply_kernel(blurred_image, blur_kernel(block_size))
    threshold_matrix = []
    for row_index in range(len(image)):
        threshold_row = []
        for column_index in range(len(image[0])):
            threshold_row.append(average_blurred_image[row_index][column_index] - c)
        threshold_matrix.append(threshold_row)

    return threshold_matrix


def extract_matrix_metadata(source):
    channels_count = len(source)
    rows_length = len(source[0])
    columns_length = len(source[0][0])
    return channels_count, rows_length, columns_length


def check_is_grayscale_image(image):
    if type(image[0][0] == list):
        return False
    return True


def check_is_valid_kernel_size(kernel_size):
    if not kernel_size.isdigit():
        return False

    kernel_size = int(kernel_size)
    if kernel_size % 2 == 0 or kernel_size <= 0:
        return False

    return True


def validate_resize_parameters(resize_parameters):
    splitted_parameters = resize_parameters.split(',')

    if len(splitted_parameters) != 2:
        return False

    height = splitted_parameters[0]
    width = splitted_parameters[1]

    if not height.isdigit() or not width.isdigit():
        return False

    height = int(height)
    width = int(width)

    if height < 1 or width < 1:
        return False

    return True, height, width


def validate_edge_parameters(edge_parameters):
    splitted_parameters = resize_parameters.split(',')

    if len(splitted_parameters) != 3:
        return False

    blur_size = splitted_parameters[0]
    block_size = splitted_parameters[1]
    c = splitted_parameters[2]
    if not blur_size.isdigit() or not block_size.isdigit() or not c.isdigit():
        return False

    c = float(c)
    if c < 0:
        return False

    if not check_is_valid_kernel_size(blur_size) or not check_is_valid_kernel_size(block_size):
        return False

    return True, blur_size, blur_size, c


def apply_image_function_on_colored_image(image, lambda_function):
    seperated_channels = separate_channels(image)
    processed_channel = []
    for channel in seperated_channels:
        processed_channel.append(lambda_function(channel))
    image = combine_channels(processed_channel)

    return image


def check_is_valid_hues(hues_parameter):
    if not hues_parameter.isdigit():
        return False

    hues_parameter = int(hues_parameter)
    if hues_parameter < 1:
        return False

    return True, hues_parameter


if __name__ == '__main__':
    args = sys.argv
    if len(args) != 2:
        print("Usage: image_editor.py <image_path>. Missing argument.")
        sys.exit(1)

    try:
        image = ex6_helper.load_image(args[1])
    except FileNotFoundError:
        print("Image file not found.")
        sys.exit(1)
    except PIL.UnidentifiedImageError:
        print("Image file is not in valid format.")
        sys.exit(1)

    is_grayscale_image = check_is_grayscale_image(image)
    input_message = "Choose option: \n 1. convert image to grayscale \n 2. blur image \n 3. resize image \n 4. rotate image in 90 degrees \n 5. create image edges \n 6.quantize image \n 7. show image \n 8. exit"

    user_input = input(input_message)
    while user_input != "8":
        match user_input:
            case "1":
                if is_grayscale_image:
                    print("Image is grayscale.")
                else:
                    image = RGB2grayscale(image)
                    is_grayscale_image = True
            case "2":
                kernel_size = input("Enter kernel size (pixel): ")
                if check_is_valid_kernel_size(kernel_size):
                    kernel = blur_kernel(kernel_size)
                    if is_grayscale_image:
                        image = apply_kernel(image, kernel)
                    else:
                        image = apply_image_function_on_colored_image(image,
                                                                      lambda channel: apply_kernel(channel, kernel))
                        # seperated_channels = separate_channels(image)
                        # applied_kernels = []
                        # for channel in seperated_channels:
                        #   applied_kernels.append(apply_kernel(channel,kernel))
                        # image = combine_channels(applied_kernels)
                else:
                    print("Invalid kernel size.")
            case "3":
                resize_parameters = input(
                    "Enter resize parameters: new height, new width (in that order, seperated by ',')")
                is_valid, height, width = validate_resize_parameters(resize_parameters)
                if is_valid:
                    if is_grayscale_image:
                        image = resize(image, height, width)
                    else:
                        image = apply_image_function_on_colored_image(image,
                                                                      lambda channel: resize(channel, height, width))
                else:
                    print("Invalid resize parameters.")
            case "4":
                direction = input("Enter direction for rotation (L/R): ")
                if direction == "L" or direction == "R":
                    image = rotate_90(image, direction)
                else:
                    print("Invalid direction.")
            case "5":
                edges_parameters = input(
                    "Enter edges parameters: blur_size, block_size, c (in the following order, seperated by ',')")
                is_valid, blur_size, block_size, c = validate_edge_parameters(edges_parameters)
                if is_valid:
                    if not is_grayscale_image:
                        image = RGB2grayscale(image)
                        is_grayscale_image = True
                    image = get_edges(image, blur_size, block_size, c)
                else:
                    print("Invalid edges parameters.")
            case "6":
                hues_parameter = input("Enter number of hues: ")
                is_valid, number_of_hues = check_is_valid_hues(hues_parameter)
                if is_valid:
                    if is_grayscale_image:
                        image = quantize(image, number_of_hues)
                    else:
                        image = apply_image_function_on_colored_image(image,
                                                                      lambda channel: quantize(channel, number_of_hues))
                else:
                    print("Invalid number of hues.")
            case "7":
                ex6_helper.show_image(image)
            case _:
                print("Unknown input.")
        user_input = input(input_message)
    path = input("Enter path to save image file: ")
    ex6_helper.save_image(image, path)
