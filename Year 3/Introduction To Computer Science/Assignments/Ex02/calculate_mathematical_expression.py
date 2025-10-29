#################################################################
# FILE : math_print.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex2 2025
# DESCRIPTION: A simple program that provides my secret key.
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools, docs.python.org
# NOTES: ...
#################################################################
# Gets two numbers and one mathematical operation and returns the mathematical operation result on them.
def calculate_mathematical_expression(first_number, second_number, operation):
    match operation:
        case "+":
            return first_number + second_number
        case "*":
            return first_number * second_number
        case "-":
            return first_number - second_number
        case ":":
            if second_number != 0:
                return first_number / second_number
            else:
                return None
        case _:
            return None
    # This else case catches not allowed operation or allowed operation and invalid action (like diving zero).


"""Gets an expression from the format 'number operation number', split by format
 and return using calculate_mathematical_expression the operation result"""
def calculate_from_string(expression):
    split_expression = expression.split(' ')
    if len(split_expression) != 3:
        return None

    return calculate_mathematical_expression(float(split_expression[0]), float(split_expression[2]), split_expression[1])