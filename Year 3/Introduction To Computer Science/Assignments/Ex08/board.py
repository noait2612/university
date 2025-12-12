#################################################################
# FILE : board.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex8 2025
# DESCRIPTION: A class that represents a board and it's API.
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools, docs.python.org
# NOTES: ...
#################################################################
from typing import Tuple, List, Optional
from car import Car

Coordinates = Tuple[int, int]

##############################################################################
#                                   Constants                                #
##############################################################################

BOARD_LENGTH = 7
TARGET_ROW = 3
EMPTY_CELL = "_"


class Board:
    """
    A class that represents a board and it's API.
    """

    def __init__(self) -> None:
        """
        A constructor for a Board object.
        """
        self.__board = [[EMPTY_CELL] * BOARD_LENGTH for _ in range(BOARD_LENGTH)]
        self.__cars = {}
        self.__occupied_cells = set()
        self.__cells_list = self.__all_cells_factory()

    def __str__(self) -> str:
        """
        This function is called when a board object is to be printed.
        :return: A string representing the current status of the board.
        """
        # The game may assume this function returns a reasonable representation
        # of the board for printing, but may not assume details about it.
        # implement your code and erase the "pass"
        board_grid = [[EMPTY_CELL for _ in range(BOARD_LENGTH)] for _ in range(BOARD_LENGTH)]
        for name, car in self.__cars.items():
            for row, column in car.car_coordinates():
                board_grid[row][column] = name

        output = ""
        for index in range(BOARD_LENGTH):
            row_content = " ".join(board_grid[index])

            if index == self.target_location()[0]:
                row_content += " E"
            else:
                row_content += " *"
            output += row_content + "\n"

        return output

    def cell_list(self) -> List[Coordinates]:
        """
        This function returns the coordinates of cells in this board.
        :return: list of coordinates.
        """
        return self.__cells_list

    def possible_moves(self) -> List[Tuple[str, str, str]]:
        """ 
        This function returns the legal moves of all cars in this board.
        :return: list of tuples of the form (name, move_key, description)
                 representing legal moves. The description should briefly
                 explain what is the movement represented by move_key.
        """
        valid_moves = []
        for name, car in self.__cars.items():
            for move_key, description in car.possible_moves():
                required_cells = car.movement_requirements()

                if required_cells is not []:
                    is_valid_move = True
                    for coordinate in required_cells:
                        if not self.__is_valid_coordinate(coordinate) and coordinate is not self.target_location():
                            is_valid_move = False
                            break

                        if coordinate in self.__occupied_cells and coordinate is not self.target_location():
                            is_valid_move = False
                            break

                    if is_valid_move:
                        valid_moves.append((name, move_key, description))

        return valid_moves

    def target_location(self) -> Coordinates:
        """
        This function returns the coordinates of the location that should be
        filled for victory.
        :return: (row, col) of the goal location.
        """
        return TARGET_ROW, BOARD_LENGTH

    def cell_content(self, coordinates: Coordinates) -> Optional[str]:
        """
        Checks if the given coordinates are empty.
        :param coordinates: tuple of (row, col) of the coordinates to check.
        :return: The name of the car in "coordinates", None if it's empty.
        """
        if coordinates in self.cell_list():
            return None

        current = self.__board[coordinates[0]][coordinates[1]]
        if current == EMPTY_CELL:
            return None
        else:
            return current

    def add_car(self, car: Car) -> bool:
        """
        Adds a car to the game.
        :param car: car object to add.
        :return: True upon success, False if failed.
        """
        car_name = car.get_name()

        if len(car_name) == 1 and car_name.isalpha() and car_name.isalpha():
            if car_name in self.__cars.keys():
                return False
            elif not self.__is_validate_car_location(car):
                return False
            else:
                self.__cars.__dict__[car_name] = car
                for coordinate in car.car_coordinates():
                    self.__occupied_cells.add(coordinate)
        else:
            return False

    def move_car(self, name: str, move_key: str) -> bool:
        """
        Moves car one step in a given direction.
        :param name: name of the car to move.
        :param move_key: the key of the required move.
        :return: True upon success, False otherwise.
        """
        if name not in self.__cars.keys():
            return False

        car = self.__cars[name]
        if move_key not in car.possible_moves().keys():
            return False

        movement_requirements = car.movement_requirements()
        if movement_requirements not in self.cell_list() or self.__board[movement_requirements[0]][
            movement_requirements[1]] != EMPTY_CELL:
            return False

        move_tuple = (name, move_key, car.possible_moves()[move_key])
        if move_tuple not in self.possible_moves():
            return False

        old_coordinates = car.get_coordinates()
        self.__discard_occupied_cells(old_coordinates)

        if not car.move(move_key):
            self.__assign_occupied_cells(old_coordinates)
            return False

        self.__assign_occupied_cells(car.get_coordinates())
        return True

    def __is_validate_car_location(self, car: Car) -> bool:
        car_coordinates = car.car_coordinates()
        for coordinate in car_coordinates:
            if not self.__is_valid_coordinate(coordinate):
                if coordinate != self.target_location():
                    return False

            if coordinate in self.__occupied_cells:
                return False

        return True

    def __is_valid_coordinate(self, coordinates: Coordinates) -> bool:
        row_index, column_index = coordinates
        return 0 <= row_index < BOARD_LENGTH and 0 <= column_index < BOARD_LENGTH

    def __assign_occupied_cells(self, coordinates: Coordinates):
        for coordinate in coordinates:
            self.__occupied_cells.add(coordinate)

    def __discard_occupied_cells(self, coordinates: Coordinates):
        for coordinate in coordinates:
            self.__occupied_cells.discard(coordinate)

    def __all_cells_factory(self):
        cell_list = []
        for row_index in range(BOARD_LENGTH):
            for column_index in range(BOARD_LENGTH):
                cell_list.append((row_index, column_index))
        cell_list.append(self.target_location())
        return cell_list
