#################################################################
# FILE : function_power.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex11 2025
# DESCRIPTION: A class that implements function_power, meaning we get n in N and returns f^(n)(x), running the function on x n times.
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools, docs.python.org
# NOTES: ...
#################################################################
def function_power(f, n):
    def inner(x):
        result = x
        for _ in range(n):
            result = f(result)
        return result

    return inner