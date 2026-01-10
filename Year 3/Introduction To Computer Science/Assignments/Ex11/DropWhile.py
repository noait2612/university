#################################################################
# FILE : DropWhile.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex11 2025
# DESCRIPTION: A class that implements DropWhile class - Dropping till a function says otherwise and then returns the other items in the list.
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools, docs.python.org
# NOTES: ...
#################################################################
class DropWhile:
    def __init__(self, f, it):
        self.f = f
        self.it = it
        self.should_keep_dropping = True

    def __iter__(self):
        return self

    def __next__(self):
        if self.should_keep_dropping:
            while True:
                try:
                    value = next(self.it)
                    if not self.f(value):
                        self.should_keep_dropping = False
                        return value
                except StopIteration:
                    raise StopIteration
        else:
            return next(self.it)
