#################################################################
# FILE : game.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex8 2025
# DESCRIPTION: A class that represents a game and it's API.
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools, docs.python.org
# NOTES: ...
#################################################################
from board import Board


class Game:
    """
    A class that represents a Game of 'Rush Hour' and it's API.
    """

    def __init__(self, board: Board) -> None:
        """
        Initialize a new Game object.
        :param board: An object of type board
        """
        self.__board = board

    def __single_turn(self):
        """
        Note - this function is here to guide you and it is *not mandatory*
        to implement it. 

        The function runs one round of the game :
            1. Get user's input of: what color car to move, and what 
                direction to move it.
            2. Check if the input is valid.
            3. Try moving car according to user's input.

        Before and after every stage of a turn, you may print additional 
        information for the user, e.g., printing the board. In particular,
        you may support additional features, (e.g., hints) as long as they
        don't interfere with the API.
        """
        print(self.__board)
        user_input = input("Enter car to move: \n")
        if user_input == "!":
            return -1

        if not self.__is_input_in_format(user_input):
            print("Invalid input.")
            return 0

        result = self.__board.move_car(*user_input.split(','))
        if result:
            return 1

        print("Invalid car move command.")
        return 0

    def play(self) -> None:
        """
        The main driver of the Game. Manages the game until completion.
        :return: None
        """
        while not self.__did_win():
            if self.__single_turn() == -1:
                break

    def __is_input_in_format(self, user_input: str) -> bool:
        if " " in user_input:
            return False

        splitted_user_input = user_input.split(',')
        if len(splitted_user_input) == 2:
            name = splitted_user_input[0]
            direction = splitted_user_input[1]
            if len(name) == 1 and len(direction) == 1:
                return True

        return False

    def __did_win(self):
        target = self.__board.target_location()
        if self.__board.cell_content(target) is not None:
            return True

        return False
