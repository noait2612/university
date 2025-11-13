#############################################################
# FILE: lab1.py
# WRITER: your_name , your_login , your_id
# EXERCISE: intro2cs lab4 2026
# DESCRIPTION: A simple program that for nim game
# the standard output (screen)
#############################################################

def init_board():
    return [[1 for _ in range(s)] for s in [1, 3, 5, 7]]


def get_input(board):
    end_turn = False
    row = -1
    cols = []
    while row == -1:
        selected_row = int(input("Select row: "))
        if check_row_number_validity(board, selected_row):
            row = selected_row
        else:
            print("Invalid row")

    while not end_turn or len(cols) == 0:
        selected_col = input("Select column (leave empty to end turn, specify range): ")
        if selected_col == "" and len(cols) != 0:
            end_turn = True
            continue
        if selected_col.isdigit():
            selected_col = int(selected_col)
            if selected_col < len(board[row]) and board[row][selected_col] == 1 and not selected_col in cols:
                cols.append(selected_col)
                continue
            else:
                print("Selection is invalid.")
                continue

        l = selected_col.split("-")
        if len(l) != 2 or any(not t.isdigit() for t in l):
            print("Invalid column range")
            continue

        start = int(l[0])
        end = int(l[1])
        if not -1 < start < end < len(board[row]):
            print("Invalid range numbers")
            continue
        cols += range(start, end+1)

    return row, cols


def run_game():
    board = init_board()
    player = 0
    while not is_board_empty(board):
        print(f"Player {player} turn:")
        print_board(board)
        row, cols = get_input(board)
        update_board(board, row, cols)
        player = get_next_player(player)

    print(f"Player {1-player} wins!")


def print_board(board):
    k = max([len(r) for r in board])
    print(end='   ')
    for i in range(k):
        print(i, end=' ')
    print()
    print(end='  ')
    for i in range(k):
        print(end='--')
    print()

    i = 0
    for row in board:
        print(i, end = ': ')
        i += 1
        for match in row:
            print(match, end=' ')
        print()


def update_board(board, row, cols):
    for col in cols:
        board[row][col] = 0


def get_next_player(current_player):
    return 1-current_player


def is_board_empty(board):
    return all(all(match == 0 for match in row) for row in board)


def check_row_number_validity(board, selected_row):
    return -1 < selected_row < len(board) and any(s == 1 for s in board[selected_row])

if __name__ == "__main__":
    run_game()
