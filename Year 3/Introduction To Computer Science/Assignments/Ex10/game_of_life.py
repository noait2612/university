#################################################################
# FILE : game_of_life.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex10 2025
# DESCRIPTION: A class that implements game of life (math question) for default kenrel and special kernel.
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: numpy.org
# NOTES: ...
#################################################################
import numpy


def game_of_life(board: numpy.ndarray, gen_num: int) -> numpy.ndarray:
    current_board = board.copy()

    if gen_num <= 0:
        return current_board

    rows, columns = current_board.shape

    for _ in range(gen_num):
        next_board = numpy.zeros_like(current_board)
        padded_board = numpy.pad(current_board, 1)
        for row_index in range(rows):
            for column_index in range(columns):
                current_position = current_board[row_index, column_index]
                window = padded_board[row_index:row_index + 3, column_index:column_index + 3]
                sum_neighbours = numpy.sum(window) - current_position

                # Living cell with 2 or 3 neighbours stays alive
                if current_position == 1:
                    if sum_neighbours == 2 or sum_neighbours == 3:
                        next_board[row_index, column_index] = 1

                # Cell with 3 neighbours turns alive
                else:
                    if sum_neighbours == 3:
                        next_board[row_index, column_index] = 1
        current_board = next_board

    return current_board


def game_of_life_kernel(board: numpy.ndarray, kernel: numpy.ndarray, gen_num: int, life_threshold=2,
                        overcrowding_threshold=4) -> numpy.ndarray:
    if gen_num <= 0:
        return board.copy()

    height, width = kernel.shape
    for _ in range(gen_num):
        output = numpy.zeros(board.shape)
        input_padded = numpy.pad(board, pad_width=len(kernel)//2, mode='constant', constant_values=0)
        for i in range(board.shape[0]):
            for j in range(board.shape[1]):
                region = input_padded[i:i + height, j:j + width]
                s = numpy.sum(region * kernel)

                if overcrowding_threshold > s >= life_threshold:
                    output[i, j] = 1

        board = output

    return board
