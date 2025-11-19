#################################################################
# FILE : battleship.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex4 2025
# DESCRIPTION: Battleship game.
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools, docs.python.org
# NOTES: ...
#################################################################
import helper
locations = set([])

# Init board with given rows and columns
def init_board(rows, columns):
    return [[helper.WATER for _ in range(columns)] for _ in range(rows)]


# Ship is valid if it is in range in columns and rows and we don't have another ship from this position to this position + size.
def valid_ship(board, size, loc):
    row_index = int(loc[0])
    column_index = int(loc[1])
    # go out of range for rows or out of range for columns
    if row_index + size > len(board) or column_index > len(board[row_index]):
        return False
    # if I hit another battleship
    for index in range(size):
        if board[row_index + index][column_index] != helper.WATER:
            return False

    return True


# Convert from template to AN where A is column and N is row
def cell_name_to_loc(name):
    mapping = (int(name[1:]) - 1, ord(name[0]) - ord('A'))
    return mapping


# Check if this coordinate is our board.
def is_coordinate_in_range(coordinate):
    return coordinate[1] < helper.NUM_COLUMNS and coordinate[0] < helper.NUM_ROWS


# Create player board from size ROWS TIMES COLUMNS and fill it by user inputs for each ship size.
def create_player_board(rows, columns, ship_sizes):
    board = init_board(rows, columns)
    for ship_size in ship_sizes:
        helper.show_board(board)
        did_create_ship = False
        while not did_create_ship:
            user_input = helper.get_input(
                f"Please enter coordinates for the ship from size {ship_size}, enter in format: 'XN' where X is a letter the defines the column and N is a number that defines the row:")
            if helper.is_cell_name(user_input):
                board_coordinates = cell_name_to_loc(user_input.upper())
                if valid_ship(board, ship_size, board_coordinates):
                    place_ship(board, ship_size, board_coordinates)
                    did_create_ship = True
                else:
                    helper.show_msg(
                        f"Can't create battleship from size: {ship_size} in location: {board_coordinates}; Not a valid ship position")
            else:
                helper.show_msg(f"{user_input} is not a valid coordinate format")
    return board


# Create random board from size of ROWS times Columns and fill the board with the ship sizes.
def create_computer_board(rows, columns, ship_sizes):
    global locations
    board = init_board(rows, columns)
    for ship_size in ship_sizes:
        random_coordinates = helper.choose_ship_location(board, ship_size, locations)
        place_ship(board, ship_size, random_coordinates)

    return board


# Place ship from given size in location pair of (row, column) coordinate.
def place_ship(board, ship_size, location):
    row_coordinates = location[0]
    column_coordinates = location[1]
    for row_index in range(len(board)):
        if row_index >= row_coordinates and ship_size > 0:
            for column_index in range(len(board[row_index])):
                if column_coordinates == column_index:
                    board[row_index][column_index] = helper.SHIP
                    ship_size -= 1


# Strip the boards to tuple of (row_index, column_index)
def initialize_coordinates_pairs():
    global locations
    for row_index in range(helper.NUM_ROWS):
        for column_index in range(helper.NUM_COLUMNS):
            locations.add((row_index, column_index))


# The game of battleship.
def main():
    while True:
        initialize_coordinates_pairs()
        player_board = create_player_board(helper.NUM_ROWS, helper.NUM_COLUMNS, helper.SHIP_SIZES)
        computer_board = create_computer_board(helper.NUM_ROWS, helper.NUM_COLUMNS, helper.SHIP_SIZES)
        player_total_ships_blocks = sum_ships_blocks(helper.SHIP_SIZES)
        computer_total_ships_blocks = player_total_ships_blocks
        computer_discovered_board = init_board(helper.NUM_ROWS, helper.NUM_COLUMNS)
        while player_total_ships_blocks != 0 and computer_total_ships_blocks != 0:
            helper.show_board(player_board, computer_discovered_board)
            player_target_coordinates = get_player_target_coordinates(computer_discovered_board)
            computer_target_coordinates = get_computer_target_coordinates(player_board)
            player_total_ships_blocks = mark_hit(player_board, computer_target_coordinates, player_total_ships_blocks)
            computer_total_ships_blocks = mark_hit(computer_board, player_target_coordinates,
                                                   computer_total_ships_blocks, computer_discovered_board)

        print_winner(player_total_ships_blocks, computer_total_ships_blocks)

        helper.show_board(player_board, computer_board)

        if not should_replay():
            break


# Marks hit on board and if hit ship reduce the total ships blocks size. Can get hidden board.
def mark_hit(board, hit_coordinates, total_ships_blocks, hidden_board=None):
    global locations
    if board[hit_coordinates[0]][hit_coordinates[1]] == helper.WATER:
        board[hit_coordinates[0]][hit_coordinates[1]] = helper.HIT_WATER
        if hidden_board is not None:
            hidden_board[hit_coordinates[0]][hit_coordinates[1]] = helper.HIT_WATER
            locations.discard(hit_coordinates)

    else:
        board[hit_coordinates[0]][hit_coordinates[1]] = helper.HIT_SHIP
        total_ships_blocks -= 1
        locations.discard((hit_coordinates))
        if hidden_board is not None:
            hidden_board[hit_coordinates[0]][hit_coordinates[1]] = helper.HIT_SHIP

    return total_ships_blocks


# sum all the ships sizes for blocks.
def sum_ships_blocks(ship_sizes):
    blocks_sum = 0
    for size in ship_sizes:
        blocks_sum += size

    return blocks_sum


# Check which board is destroyed and print the winner.
def print_winner(player_total_ships_blocks, computer_total_ships_blocks):
    if player_total_ships_blocks == 0 and computer_total_ships_blocks == 0:
        helper.show_msg("The player's navy and the computer navy's are both destroyed!")
    elif player_total_ships_blocks == 0:
        helper.show_msg("Player navy is destroyed! The winner is the computer.")
    else:
        helper.show_msg("Computer navy is destroyed! The winner is the player.")


# Get user selected target coordinates on target board, the player can hit iff the point is water
def get_player_target_coordinates(board):
    player_target_coordinates = None
    while player_target_coordinates is None:
        user_input = helper.get_input("Enter coordinates for sending torpedo:")
        if helper.is_cell_name(user_input):
            board_coordinates = cell_name_to_loc(user_input.upper())
            if is_coordinate_in_range(board_coordinates) and board[board_coordinates[0]][
                board_coordinates[1]] == helper.WATER:
                player_target_coordinates = board_coordinates
            else:
                helper.show_msg("Location is invalid")
        else:
            helper.show_msg("Location is invalid")
    return player_target_coordinates


# Computer generated targets on player board only if we didn't hit there already
def get_computer_target_coordinates(board):
    global locations
    computer_target_coordinates = None
    while computer_target_coordinates is None:
        board_coordinates = helper.choose_torpedo_target(board, locations)
        value = board[board_coordinates[0]][board_coordinates[1]]
        if value != helper.HIT_WATER and value != helper.HIT_SHIP:
            computer_target_coordinates = board_coordinates

    return computer_target_coordinates


# Get from player if we should replay
def should_replay():
    should_play_again = None
    while should_play_again is None:
        user_input = helper.get_input("Play again? Valid Selection are 'N' or 'Y'")
        if user_input == "Y":
            should_play_again = True
        if user_input == "N":
            should_play_again = False

    return should_play_again


if __name__ == "__main__":
    main()
