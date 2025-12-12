#################################################################
# FILE : car.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex8 2025
# DESCRIPTION: A class that represents a car and it's API.
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools, docs.python.org
# NOTES: ...
#################################################################
from typing import Tuple, List, Dict

Coordinates = Tuple[int, int]
##############################################################################
#                                   Constants                                #
##############################################################################

HORIZONTAL = 1
VERTICAL = 0
HORIZONTAL_MOVE = {'r': (0, 1), 'l': (0, -1)}
VERTICAL_MOVE = {'d': (1, 0), 'u': (1, -1)}


class Car:
    """
    A class that represents a car and it's API.
    """

    def __init__(self, name: str, length: int, location: Coordinates, orientation: int):
        """
        A constructor for a Car object.
        :param name: A string representing the car's name.
        :param length: A positive int representing the car's length.
        :param location: A tuple representing the car's head location (row,col).
        :param orientation: One of either 0 (VERTICAL) or 1 (HORIZONTAL).
        """
        self.__name = name
        self.__length = length
        self.__orientation = orientation
        self.__location = tuple(location)

    def car_coordinates(self) -> List[Coordinates]:
        """
        :return: A list of coordinates the car is in.
        """
        coordinates = []
        start_row, start_column = self.__location
        if self.__orientation == HORIZONTAL:
            for i in range(self.__length):
                coordinates.append((start_row, start_column + i))
        elif self.__orientation == VERTICAL:
            for i in range(self.__length):
                coordinates.append((start_row + i, start_column))

        return coordinates

    def possible_moves(self) -> Dict[str, str]:
        """
        :return: A dictionary of strings describing possible movements 
                 permitted by this car.
        """
        moves = {}
        if self.__orientation == HORIZONTAL:
            moves['r'] = "moves one step right"
            moves['l'] = "moves one step left"

        elif self.__orientation == VERTICAL:
            moves['u'] = "moves one step up"
            moves['d'] = "moves one step down"

        return moves

    def movement_requirements(self, move_key: str) -> List[Coordinates]:
        """ 
        :param move_key: A string representing the key of the required move.
        :return: A list of cell locations which must be empty in order for 
                 this move to be legal.
        """
        if move_key not in self.possible_moves().keys():
            return []

        start_row, start_column = self.__location

        if self.__orientation == HORIZONTAL:
            if move_key == "r":
                return [(start_row, start_column + self.__length)]
            elif move_key == "l":
                return [(start_row, start_column - 1)]
        elif self.__orientation == VERTICAL:
            if move_key == "u":
                return [(start_row - 1, start_column)]
            elif move_key == "d":
                return [(start_row + self.__length, start_column)]

        return []

    def move(self, move_key: str) -> bool:
        """ 
        This function moves the car.
        :param move_key: A string representing the key of the required move.
        :return: True upon success, False otherwise
        """
        # implement your code and erase the "pass"
        if move_key not in self.possible_moves().keys():
            return False

        start_row, start_column = self.__location
        row_move, column_move = (
            HORIZONTAL_MOVE[move_key] if self.__orientation == HORIZONTAL else VERTICAL_MOVE[move_key])
        new_row = start_row + row_move
        new_column = start_column + column_move
        self.__location = (new_row, new_column)
        return True

    def get_name(self) -> str:
        """
        :return: The name of this car.
        """
        return self.__name
