#################################################################
# FILE : bfs_order.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex11 2025
# DESCRIPTION: A class that implements bfs_order for trees: runs by Breadth First Traversal and yields the value in the leaf.
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools, docs.python.org
# NOTES: ...
#################################################################
class Tree:
    def __init__(self, value, branches=[]):
        self.value = value
        self.branches = list(branches)

def bfs_order(tree):
    if tree is None:
        return

    queue = [tree]
    while queue:
        current = queue.pop(0)
        yield current.value

        if current.branches:
            queue.extend(current.branches)