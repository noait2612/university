#################################################################
# FILE : diff_iter.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex11 2025
# DESCRIPTION: A class that implements diff_iter: gets list of numbers and iterate on the diffs between each two numbers next to each other on the list.
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools, docs.python.org
# NOTES: ...
#################################################################
def diff_iter(some_iter):
    iterator = iter(some_iter)
    try:
        previous = next(iterator)
    except StopIteration:
        return

    for current in iterator:
        yield current - previous
        previous = current