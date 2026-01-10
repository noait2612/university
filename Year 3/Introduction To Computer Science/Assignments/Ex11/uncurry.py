#################################################################
# FILE : uncurry.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex11 2025
# DESCRIPTION: A class that implements uncurry - making curry function to uncurry function syntax.
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools, docs.python.org
# NOTES: ...
#################################################################
def uncurry(n):
    def decorator(f):
        def inner(*args):
            if len(*args) != n:
                raise TypeError(f"expected {n} arguments, got {len(*args)} arguments")
            result = f(*args[0])  # This is always defined well since we assume n in NN so at least one.

            for index in range(1, n):
                result = result(*args[index])

            return result

        return inner

    return decorator
