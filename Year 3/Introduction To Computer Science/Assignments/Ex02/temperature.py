#################################################################
# FILE : math_print.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex2 2025
# DESCRIPTION: A simple program that provides my secret key.
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools, docs.python.org
# NOTES: ...
#################################################################
# Checking if each day is over given threshold temperature and check if we have any pair from the combination ((1,2),(1,3),(2,3))
def is_vormir_safe(threshold_temperature, first_day_temperature, second_day_temperature, third_day_temperature):
    is_first_day_over_threshold_temperature = is_over_threshold_temperature(threshold_temperature,
                                                                            first_day_temperature)
    is_second_day_over_threshold_temperature = is_over_threshold_temperature(threshold_temperature,
                                                                             second_day_temperature)
    is_third_day_over_threshold_temperature = is_over_threshold_temperature(threshold_temperature,
                                                                            third_day_temperature)
    if is_first_day_over_threshold_temperature and (
            is_second_day_over_threshold_temperature or is_third_day_over_threshold_temperature):
        return True

    return is_second_day_over_threshold_temperature and is_third_day_over_threshold_temperature


def is_over_threshold_temperature(threshold_temperature, temperature):
    return temperature > threshold_temperature
