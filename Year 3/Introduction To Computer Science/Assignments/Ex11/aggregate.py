#################################################################
# FILE : aggregate.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex11 2025
# DESCRIPTION: A class that implements aggregate function to return history of runs.
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools, docs.python.org
# NOTES: ...
#################################################################
def aggregate(f):
    results = []

    def inner(x):
        value = f(x)
        results.append(value)
        return results[:]

    return inner