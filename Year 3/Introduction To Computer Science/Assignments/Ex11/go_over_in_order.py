#################################################################
# FILE : go_over_in_order.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex11 2025
# DESCRIPTION: A class that implements go_over_in_order: gets list of numbers order them using yield.
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools, docs.python.org
# NOTES: ...
#################################################################
def go_over_in_order(iterable):
    previous = None
    while True:
        candidate = None
        for x in iterable:
            if previous is None or x > previous:
                if candidate is None or x < candidate:
                    candidate = x

        if candidate is None:
            break

        yield candidate
        previous = candidate