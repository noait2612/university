#################################################################
# FILE : math_print.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex2 2025
# DESCRIPTION: A simple program that provides my secret key.
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools, docs.python.org
# NOTES: ...
#################################################################
import math


# Calculating area shape from user input.
def shape_area():
    print("Choose shape (1=circle, 2=rectangle, 3=triangle): ")
    user_input = input()
    match user_input:
        case "1":
            radius = input()
            return math.pi * math.pow(radius, 2)
        case "2":
            first_edge = input()
            second_edge = input()
            return first_edge * second_edge
        case "3":
            edge = input()
            return (math.sqrt(3) * math.pow(edge, 2)) / 4
        case _:
            return None
