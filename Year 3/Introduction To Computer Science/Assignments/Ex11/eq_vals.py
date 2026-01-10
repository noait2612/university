#################################################################
# FILE : eq_vals.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex11 2025
# DESCRIPTION: A class that implements eq_vals function.
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools, docs.python.org
# NOTES: ...
#################################################################
def eq_vals(func, lzt):
    grouping = {}

    for item in lzt:
        result = func(item)
        if result not in grouping:
            grouping[result] = []

        grouping[result].append(item)

    return list(grouping.values())