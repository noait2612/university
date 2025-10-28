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


# Gets the solutions of quadratic equation by first calculating the discriminant and then by quadratic formula
def quadratic_equation(leading_coefficient, second_coefficient, constant_coefficient):
    discriminant = second_coefficient ** 2 - 4 * leading_coefficient * constant_coefficient
    """this is the case that the quadratic equation has zero results in RR"""
    if discriminant < 0:
        return None, None
    elif discriminant == 0:
        """this is the case that the quadratic equation has one solution in RR"""
        return (-second_coefficient) / (2 * leading_coefficient), None
    else:
        """this is the case that the quadratic equation has two solutions in RR"""
        return ((-second_coefficient + math.sqrt(discriminant)) / (2 * leading_coefficient),
                (-second_coefficient - math.sqrt(discriminant)) / (2 * leading_coefficient))


def quadratic_equation_user_input():
    print("Insert coefficients a, b, and c: ")
    user_input = input().split(' ')
    if len(user_input) != 3:
        return None

    if user_input[0] == "0":
        print("The parameter 'a' may not equal 0")
    else:
        first_root, second_root = quadratic_equation(float(user_input[0]), float(user_input[1]), float(user_input[2]))
        if first_root is None and second_root is None:
            print("The equation has no solutions")
        elif first_root is not None and second_root is None:
            print(f"The equation has 1 solution: {first_root}")
        else:
            print(f"The equation has 2 solutions: {first_root} and {second_root}")
