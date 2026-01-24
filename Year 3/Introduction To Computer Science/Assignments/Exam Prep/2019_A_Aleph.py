from functools import reduce
from typing import *
import pytest


# Only open questions.
# Question 1: make dict closed (the only items that returns appears both keys and both on values)
def make_closed(dict1):
    while True:
        current_keys = set(dict1.keys())
        keys_to_remove = []
        for key, value in dict1.items():
            if value not in current_keys:
                keys_to_remove.append(key)
        if not keys_to_remove:
            break
        for key in keys_to_remove:
            dict1.pop(key)
    return dict1


# Question 2: Created double-linked list from two lists from the same size
class Node:
    def __init__(self, data, next=None, previous=None):
        self.data = data
        self.next = next
        self.previous = previous

    def __repr__(self):
        nodes = []
        current = self
        while current:
            nodes.append(str(current.data))
            current = current.next

        # Join them with arrows to visualize the links
        return " <-> ".join(nodes)


def weave(a, b):
    if len(a) == 0:
        return None

    root = Node(a[0])
    current = root
    b_node = Node(b[0], previous=current)
    current.next = b_node
    current = b_node

    for i in range(1, len(a)):
        new_a = Node(a[i], previous=current)
        current.next = new_a
        current = new_a

        new_b = Node(b[i], previous=current)
        current.next = new_b
        current = new_b

    return root


# Question 4:

def has_x_peaks(lst, x):
    if not lst:
        return x == 0

    peak_count = 0
    n = len(lst)

    if n == 1 or lst[0] >= lst[1]:
        peak_count += 1

    for i in range(1, n - 1):
        if peak_count > x:
            return False

        if lst[i] >= lst[i - 1] and lst[i] <= lst[i + 1]:
            peak_count += 1

    if n > 1 and lst[n - 1] >= lst[n - 2]:
        peak_count += 1

    return peak_count == x


# Question 5:
def make_stack():
    items = []

    def stack_func(*args):
        if len(args) == 1:
            items.append(args[0])
            return None
        elif len(args) == 0:
            return items.pop()

    return stack_func


# Question 6:
class MyDict:
    def __init__(self):
        self.data = []

    def set(self, key, value):
        for index in range(len(self.data)):
            k, v = self.data[index]
            if k == key:
                self.data[index] = (k, value)
                return None

        self.data.append((key, value))
        return None

    def get(self, key):
        for k, v in self.data:
            if k == key:
                return v

        raise KeyError()

    def __iter__(self):
        for k, v in self.data:
            yield k
