#################################################################
# FILE : math_print.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex2 2025
# DESCRIPTION: A simple program that provides my secret key.
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools, docs.python.org
# NOTES: ...
#################################################################
# My test cases for check_largest_and_smallest are checking negative numbers and decimals


# Gets the maximal and minimal number from three numbers without using max, min or sort.
def largest_and_smallest(first_number, second_number, third_number):
    # Select largest from the possible combinations ((1,2),(1,3),(2,3))
    if first_number >= second_number and first_number >= third_number:
        largest_number = first_number
    else:
        largest_number = (second_number if second_number >= third_number else third_number)

    # Select smallest from the possible combinations ((1,2),(1,3),(2,3))
    if first_number <= second_number and first_number <= third_number:
        smallest_number = first_number
    else:
        smallest_number = (second_number if second_number <= third_number else third_number)
    return largest_number, smallest_number


def check_largest_and_smallest():
    any_false_calculation = False
    if not scenario_is_correct_largest_and_smallest(17, 1, 16, 17, 1):
        any_false_calculation = True

    if not scenario_is_correct_largest_and_smallest(1, 17, 6, 17, 1):
        any_false_calculation = True

    if not scenario_is_correct_largest_and_smallest(1, 1, 2, 2, 1):
        any_false_calculation = True

    # Checking Negative numbers.
    if not scenario_is_correct_largest_and_smallest(-1, 0, -3, 0, -3):
        any_false_calculation = True

    # Checking decimals
    if not scenario_is_correct_largest_and_smallest(2.25, 2.5, 2.75, 2.75, 2.25):
        any_false_calculation = True

    return not any_false_calculation


# Single Scenario check for largest and smallest (to reduce duplications).
def scenario_is_correct_largest_and_smallest(first_number, second_number, third_number, expected_largest,
                                             expected_smallest):
    largest, smallest = largest_and_smallest(first_number, second_number, third_number)
    return largest != expected_largest or smallest != expected_smallest
