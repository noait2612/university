#################################################################
# FILE : rush-hour.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex8 2025
# DESCRIPTION: A class that run's rush hour game.
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools, docs.python.org
# NOTES: ...
#################################################################
##############################################################################
#                                   Imports                                  #
##############################################################################
import sys
import helper
import board
import car
import game
from typing import Tuple, List, Dict

Coordinates = Tuple[int, int]

def initialize_board(board: board, car_config: dict):
    for car_name, config in car_config.items():
        board.add_car(create_car(car_name, config))

def create_car(car_name:str, config: list) -> car.Car:
    return car.Car(car_name, config[0], (config[1][0], config[1][1]), config[2])


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python rush-hour.py <path_to_json>")
    car_config = helper.load_json(sys.argv[1])
    board = board.Board()
    initialize_board(board, car_config)
    game = game.Game(board)
    game.play()