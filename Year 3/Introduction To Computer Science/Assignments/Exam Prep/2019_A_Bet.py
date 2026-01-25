from functools import reduce
from typing import *
import pytest


# Only open questions.
# Question 1:
def is_magic_square(mat):
    n = len(mat)
    if n == 0:
        return False

    target_sum = sum(mat[0])

    # 3. Check all Rows
    for row in mat:
        if sum(row) != target_sum:
            return False

    # 4. Check all Columns
    for j in range(n):
        current_col_sum = 0
        for i in range(n):
            current_col_sum += mat[i][j]

        if current_col_sum != target_sum:
            return False

    # 5. Check Main Diagonal (Top-Left to Bottom-Right)
    diag1_sum = 0
    for i in range(n):
        diag1_sum += mat[i][i]

    if diag1_sum != target_sum:
        return False

    # 6. Check Secondary Diagonal (Top-Right to Bottom-Left)
    diag2_sum = 0
    for i in range(n):
        diag2_sum += mat[i][n - 1 - i]

    if diag2_sum != target_sum:
        return False

    return True


# Question 2

class Node:
    def __init__(self, data, left=None, right=None):
        self.data, self.left, self.right = data, left, right

    def __repr__(self):
        return f"Node({self.data}, left:{self.left}, right:{self.right})"


def scramble(root):
    return inner_scramble(root, 1)


def inner_scramble(root, depth):
    if root is None:
        return []
    result = []
    if depth % 2 == 0:
        temp = root.left
        root.left = root.right
        root.right = temp

    if root.left is not None:
        result = result + inner_scramble(root.left, depth + 1)
    if root.right is not None:
        result = result + inner_scramble(root.right, depth + 1)
    if root.right is None and root.left is None:
        return result + [root.data]

    return result


node = Node(1, right=Node(3, left=Node(6)), left=Node(2, left=Node(4), right=Node(5, left=Node(7))))
print(scramble(node))
print(node)

def ranksearch(lst, k):
    if len(lst) == 1:
        return lst[0]

    pivot = lst[0]

    # 3. Partition the rest of the list
    smaller = [x for x in lst[1:] if x < pivot]
    larger = [x for x in lst[1:] if x > pivot]

    # 4. Determine the position of the pivot relative to k
    m = len(smaller)

    if k == m + 1:
        # Case 1: The pivot is exactly the k-th element
        return pivot
    elif k <= m:
        # Case 2: The answer is in the left (smaller) part
        return ranksearch(smaller, k)
    else:
        # Case 3: The answer is in the right (larger) part
        # We subtract (m + 1) because we are skipping 'm' smaller items + the pivot
        return ranksearch(larger, k - (m + 1))


class Shelf:
    def __init__(self):
        self.piles = []

    def place_item_on(self, item, thing):
        if thing is self:
            self.piles.append([item])
            return

        # Case 2: Place on an existing item
        # We must find a pile where 'thing' is the LAST element (the top)
        for pile in self.piles:
            if pile and pile[-1] == thing:
                pile.append(item)
                return

        # If we loop through everything and don't find 'thing' at the top:
        raise ValueError(f"Cannot place {item}: '{thing}' is not at the top of any pile.")

    def remove(self, thing):
        # We must find a pile where 'thing' is the LAST element (the top)
        for i, pile in enumerate(self.piles):
            if pile and pile[-1] == thing:
                pile.pop()

                # If the pile becomes empty, remove the pile entirely from the shelf
                if not pile:
                    self.piles.pop(i)
                return

        # If not found at the top of any pile
        raise ValueError(f"Cannot remove '{thing}': it is not at the top of any pile.")

    def __str__(self):
        results = []
        for pile in self.piles:
            stack_str = " on ".join(reversed(pile))
            results.append(stack_str + ".")

        return " ".join(results)
