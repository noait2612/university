#################################################################
# FILE : sub_lsts.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex11 2025
# DESCRIPTION: A class that implements sub_lsts: same as cal(P)(A) in math.
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools, docs.python.org
# NOTES: ...
#################################################################
def sub_lsts():
    subsets = [[]]
    n = 1

    while True:
        yield [s[:] for s in subsets]

        new_subsets = []
        for s in subsets:
            new_subsets.append(s[:] + [n])

        subsets.extend(new_subsets)
        n = n+1