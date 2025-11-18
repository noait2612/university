#################################################################
# FILE : battelship.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex4 2025
# DESCRIPTION: Battleship game.
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools, docs.python.org
# NOTES: ...
#################################################################
import helper


def init_board(rows, columns):
    return [[helper.WATER for _ in range(columns)] for _ in range(rows)]


def valid_ship(board, size, loc):
    row_index = int(loc[0])
    column_index = int(loc[1])
    # go out of range for rows
    if row_index + size > len(board):
        return False
    # go out of range in columns
    if column_index > len(board[row_index]):
        return False
    # if I hit another battleship
    for index in range(size):
        if board[row_index + index][column_index + index] != helper.WATER:
            return False

    return True


def cell_name_to_loc(name):
    mapping = (int(name[1]) - 1, ord(name[0]) - ord('A'))
    return mapping


def create_player_board(rows, columns, ship_sizes):
    board = init_board(rows, columns)
    for ship_size in ship_sizes:
        helper.show_board(board)
        flag = True
        while flag:
            user_input = helper.get_input(
                f"Please enter coordinates for the ship from size {ship_size}, enter in format: 'XN' where X is a letter the defines the column and N is a number that defines the row:")
            if helper.is_cell_name(user_input):
                board_coordinates = cell_name_to_loc(user_input.upper())
                if valid_ship(board, ship_size, board_coordinates):
                    row_coordinates = board_coordinates[0]
                    column_coordinates = board_coordinates[1]
                    for row_index in range(len(board)):
                        if row_index >= row_coordinates and ship_size>0:
                            for column_index in range(len(board[row_index])):
                                if column_coordinates == column_index:
                                    board[row_index][column_index] = helper.SHIP
                                    ship_size = ship_size-1
                    flag = False
                else:
                    print(
                        f"Can't create battleship from size: {ship_size} in location: {board_coordinates}; Not a valid ship position")
            else:
                print(f"{user_input} is not a valid coordinate format")
    print("final board")
    helper.show_board(board)
    return board


def create_computer_board(rows, columns, ship_sizes):
    board = init_board(rows, columns)
    for ship_size in ship_sizes:
        helper.show_board(board)



def main():
    pass


if __name__ == "__main__":
    # main()
    # helper.show_board(init_board(10, 7))
    create_player_board(10, 10, [])
