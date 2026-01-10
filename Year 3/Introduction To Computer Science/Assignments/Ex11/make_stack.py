#################################################################
# FILE : make_stack.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex11 2025
# DESCRIPTION: A class that implements make_stack that acts like a stack with manual of empty to remove from stack and with args to add to stack
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools, docs.python.org
# NOTES: ...
#################################################################
def make_stack():
    stack = []

    def stack_logic(*args):
        if args:
            stack.extend(args)
            return None
        else:
            return stack.pop()

    return stack_logic