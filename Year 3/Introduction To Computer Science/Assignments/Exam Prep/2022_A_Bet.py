from functools import reduce
from typing import *

def q3():
    print_message = True
    msg = "the product is" if print_message else ""
    lst: List[int] = [1, -2, 0, 4, -5, 6, 0, 8, 9]
    g = lambda x, y: x * y if y != 0 and y != 0 else x
    print(msg, reduce(g, lst))

def q4():
    pass # might be O(n log (n))?

def q5():
    pass # Might be O(n log(n))?

def q6():
    pass # Might be depth O(k), 2k+1

class Node:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def get_k_tuples(it, k):
    iterator = iter(it)
    window = []
    try:
        for _ in range(k):
            window.append(next(iterator))
    except StopIteration:
        return

    yield tuple(window)

    for item in iterator:
        window.pop(0)
        window.append(item)
        yield tuple(window)

def find_max_sum_pair(head: Node) -> float:
    if head is None:
        return 0

    n = 0
    current = head
    while current is not None:
        n += 1
        current = current.next

    max_sum = float('-inf')
    left = head
    for left_index in range((n+1)//2):
        right_index = n-1-left_index
        right = head
        for i in range(right_index):
            right = right.next

        current_sum = left.val+right.val
        if current_sum > max_sum:
            max_sum = current_sum

        left = left.next

    return max_sum

def xyz(num_x, num_y, num_z):
    result = []
    def backtrack(x_left, y_left, z_left, current_s):
        if x_left == 0 and y_left == 0 and z_left == 0:
            result.append(current_s)

        if x_left > 0:
            backtrack(x_left - 1, y_left, z_left, current_s + "x")
        if y_left > 0:
            backtrack(x_left, y_left-1, z_left, current_s + "y")
        if z_left > 0:
            backtrack(x_left, y_left, z_left-1, current_s + "z")

    backtrack(num_x, num_y, num_z, "")
    return result

d = {7:1, 8:2, 9:3, 10:3, 11:2,12:2}

def invert_dictionary(d):
    return {v: [k for k in d if d[k]==v] for v in set(d.values())}


def intersect(intervals: List[Tuple[float, float]], points: List[float]) -> bool:
    if len(intervals) == 0 and len(points) == 0:
        return False
    if len(intervals) == 0 and len(points) != 0:
        return False
    if len(intervals) != 0 and len(points) == 0:
        return False

    intervals.sort(key = lambda item: item[0])
    points.sort()
    i = 0
    j = 0
    n = len(intervals)
    m = len(points)

    while i < n and j<m:
        start, end = intervals[i]
        point = points[j]
        if point < start:
            j += 1
        if point > end:
            i += 1

        else:
            return True

class NewNode:
    def __init__(self, data, children):
        self.data = data
        self.children = children

def check_tree(root : NewNode):
    def validate(node: NewNode, depth):
        if not node.children:
            return depth % 2

        expected = None
        for child in node.children:
            child_result = validate(child, depth+1)
            if child_result is None:
                return None

            if expected is None:
                expected = child_result
            elif expected != child_result:
                return None

        return expected

    return validate(root, 0)


def uncurry(n):
    def decorator(f):
        def wrapper(*args):
            if len(args) != n:
                raise TypeError(f"Expected {n} arguments, but got {len(args)}")

            current_result = f
            for arg in args:
                current_result = current_result(arg)

            return current_result

        return wrapper

    return decorator

