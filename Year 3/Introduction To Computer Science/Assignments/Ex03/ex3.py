#################################################################
# FILE : math_print.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex3 2025
# DESCRIPTION: A simple program that uses lists and loops
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools, docs.python.org
# NOTES: ...
#################################################################

#Sum input of numbers until empty string, returns all the numbers and the sum result
def input_list():
    user_input_summation = 0
    numbers = []
    user_input = input()
    while is_empty_string(user_input):
        user_input_as_number = float(user_input)
        user_input_summation += user_input_as_number
        numbers.append(user_input_as_number)
        user_input = input()

    return numbers.append(user_input_summation)


#Check the inner product of two vectors.
def inner_product(vec_1, vec_2):
    if len(vec_1) != len(vec_2):
        return None

    if is_empty_list(vec_1) and is_empty_list(vec_2):
        return 0

    inner_product_result = 0
    #Inner product is calculated using sum of all multiplications of matching indices on vectors.
    for index in range(len(vec_1)):
        inner_product_result = inner_product_result + (float(vec_1[index]) * float(vec_2[index]))

    return inner_product_result


#Gets as sequence and check if the sequence is: monotonically increasing, increasing, monotonically decreasing, decreasing
def sequence_monotonicity(sequence):
    if is_empty_list(sequence) or len(sequence) == 1:
        return [True, True, True, True]

    return [sequence_monotonicity(sequence, lambda x, y: x <= y), sequence_monotonicity(sequence, lambda x, y: x < y),
            sequence_monotonicity(sequence, lambda x, y: x >= y), sequence_monotonicity(sequence, lambda x, y: x > y)]


# Checks if the sequence satisfy the given operator by the lambda_function, stops if not.
def sequence_monotonicity(sequence, lambda_function):
    current = sequence[0]
    for next_item in sequence[1:]:
        if not lambda_function(current, next_item):
            return False

        current = next_item

    return True

#Gets a list, operator and number and returns the sublist the satisfy the math operator with given number.
def filter_list(num_list, operator, number):
    if is_empty_list(num_list):
        return num_list

    valid_numbers = []
    number = float(number)
    for item in num_list:
        item = float(item)
        match operator:
            case "=":
                if item == number:
                    valid_numbers.append(item)
            case ">":
                if item > number:
                    valid_numbers.append(item)
            case "<":
                if item < number:
                    valid_numbers.append(item)

    return valid_numbers


#Runs in cycle style of a list and returns a sublist in a loop until we get to the start point again.
def cycle_sublist( lst, start, step ):
    if step > len(lst):
        return []

    sublist = []
    last_index = 0
    for index in range(start, len(lst), step):
        sublist.append(lst[index])
        if index + step > len(lst):
            last_index = index

    #The distance between the end of the list to our last index before out of bound
    delta = len(lst)-last_index

    #We need to check if we are over the start index, but otherwise keep appending by out step.
    index = step-delta
    while index < start:
        sublist.append(lst[index])
        index = index + step

    return sublist


"""As for the hint/question in the exercise page, we can know the final size of the matrix and we can use that (math!).
Let's say we have matrix N times M, meaning N rows and M columns.
We place our inner matrix of 3 times 3 on the board, over the top left corner and takes the first 3 rows and columns.
Next, we try move one step to the right. if we are in bound, we do the process above.
If not, we move one step down if we are allowed. if so, we start the process again.
Since we can't move out of bound of rows, and remember we start in index 0, the bottom of our 3 times 3 matrix
can't move past N-1 row number, and we need to select 3 rows, meaning we need to add more 2 rows.
So the maximum index will be r + 2 = N - 1 ==> r = N-3 is the MAXIMUM INDEX.
So the total number of options will be N-3+1 = N-2 (we add one since we start index in 0).
In the same way we get the total possibilities for the columns and in the same way it will me M-2.
So our result matrix will be from the size (N-2) times (M-2) and it is indeed helps us to build the correct logic."""
def convolve(mat):
    if is_empty_list(mat):
        return None

    rows_count = len(mat)
    columns_count = len(mat[0])

    #Our matrix is 3 times 3.
    if rows_count == 3 == columns_count:
        return sum_matrix(mat)

    #For any other size, we know our final matrix size so we create empty matrix from these dimensions.
    convolve_result = create_empty_matrix(rows_count-2, columns_count-2)

    # We can at most move till N-2 and M-2 as we explained above and take the matching inner matrix and stay in bound.
    for row_index in range(0, rows_count-2, 1):
        for column_index in range(0, columns_count-2, 1):
            inner_matrix = create_empty_matrix(3,3)
            for inner_row_index in range(3):
                for inner_column_index in range(3):
                    inner_matrix[inner_row_index][inner_column_index] = mat[row_index+inner_row_index][column_index+inner_column_index]

            convolve_result[row_index][column_index] = sum_matrix(inner_matrix)

    return convolve_result


#Sum all the coordinates of a matrix.
def sum_matrix(mat):
    matrix_coordinates_sum = 0
    for row in mat:
        for column in row:
            matrix_coordinates_sum = matrix_coordinates_sum + float(column)

    return matrix_coordinates_sum


def create_empty_matrix(rows_count, columns_count):
    return [[None for _ in range(columns_count)] for _ in range(rows_count)]


# Returns number of orthogonal vectors from a collection of vectors.
def num_of_orthogonal(vectors):
    number_of_orthogonal_pairs = 0
    vectors_count = len(vectors)
    """We'll create a matrix (list of lists) that contains the following data:
    each item in the list represents it's vector (by same indices), for each vector row, the columns will contains
    all the other indices that are orthogonal to this vector.
    We'll initialize with None's but after we checked we will initialize the coordinate with the orthogonal check result"""
    vector_to_orthogonal_vector_mapping = create_empty_matrix(vectors_count, vectors_count)
    for vector_index in range(vectors_count):
        vector = vectors[vector_index]
        for other_vector_index in range(1, len(vectors)):
            other_vector = vectors[other_vector_index]
            """We need to know if we already count this pair (if it is indeed orthogonal, so before that we check
            if we checked this pair before by checking in reverse order of the indices."""
            mapping = vector_to_orthogonal_vector_mapping[other_vector_index][vector_index]
            match mapping:
                case None:
                    if inner_product(vector, other_vector) == 0:
                        number_of_orthogonal_pairs += 1
                        vector_to_orthogonal_vector_mapping[vector_index][other_vector_index] = True
                    else:
                        vector_to_orthogonal_vector_mapping[vector_index][other_vector_index] = False
                case _:
                    continue

    return number_of_orthogonal_pairs


def is_empty_list(list_to_check):
    return len(list_to_check) == 0


def is_empty_string(string_to_check):
    return string_to_check == "\"\"" or string_to_check == "\""

