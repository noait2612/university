from functools import reduce
from typing import *
import pytest


# Question 1: print(foo(9)) should print [8,6,4,2,0,1,3,5,7]
def foo(n):
    lst = list()
    for i in range(n):
        lst.append(i)
        lst = lst[::-1]  # Since each time we want to reverse the result
    return lst


# Question 2: take vector to dictionary where the key is the index and the value is the value in this index
def transduce(vec):
    sp = {i: x for i, x in enumerate(vec) if x != 0}
    return sp


# Question 3: O(n^2)
def f(n):
    res = [9]
    for i in range(n // 3 + 13):
        res.insert(i // 3,
                   max(res))  # the outer loop is O(n) but the search inside for maximum is once for 1+2+3++n so (n(n+1))/2 operations = O(n^2)
    for i in range(len(res)):  # This is O(n) since  the inner logic is O(1)
        ind = (i + 2) % len(res)
        res[i] *= res[ind]
    return res


# Question 5: we call to the function with k=4, so result in the beginning is (), then (0, ()) (i = 0), then (1, (0, ())) (i=1) so we have 5 tuples
def tuple_maker(k):
    result = tuple()
    for i in range(k):
        result = (i, result * i)
    return result


# Question 6:
def combination_lock(*args):
    def next_step(current_path):
        if len(current_path) == len(args):
            return current_path == args

        def wrapper(num):
            return next_step(current_path + (num,))

        return wrapper

    def start(num):
        return next_step((num,))

    return start


# Question 7:
def find_range(dict_list):
    flatten = {}
    for dict in dict_list:
        for key, value in dict.items():
            if key in flatten.keys():
                current_min, current_max = flatten[key]
                new_min = min(current_min, value)
                new_max = max(current_max, value)
                flatten[key] = (new_min, new_max)
            else:
                flatten[key] = [value, value]

    return flatten, list(sorted(flatten.keys()))


# Question 8:
class Node:
    def __init__(self, data, left=None, right=None):
        self.data = data
        self.left = left
        self.right = right

    def __str__(self):
        return "(" + str(self.left) + " " + str(self.data) + " " + str(self.right) + ")"


def sink_nodes(root: Node):
    if root is None:
        return None

    if root.right is None and root.left is None:
        return root

    sink_nodes(root.left)
    sink_nodes(root.right)

    if root.data == 0:
        if root.left and root.left != 0:
            root.data, root.left.data = root.left.data, root.data
            sink_nodes(root.left)

        if root.right and root.right != 0:
            root.data, root.right.data = root.right.data, root.data
            sink_nodes(root.right)

    return root


# Question 2:
def f(start, end, step):
    print(start, end=" ")
    if start < end:
        f(start + step, end, step)
        print(start, end=" ")


# Question 3:
def func(n):
    if n < 3:
        return 1
    g = func(n - 1)  # First recursive call, will be called n times
    return 3 - func(n - g)  # Second recursive call


# But the place complexcity is O(1) n times meaning O(n)

# Question 4: call with [["a","b","c","d"], ["e","f","g","h"], ["i","j","k","l"], ["m","n","o","p"]]
''''Since we need at least 4 items from length at least 4, that are unique  for the first for
for the second for, we take the {j} index from each item in the array and make dict for the other values and check if it is in the other items'''


def func4(lst):
    assert len(lst) > 3
    assert len(lst[0]) > 3
    for word in lst:
        if len(set(word)) != len(word):
            return False
    for i in range(len(lst[0])):
        eyes = [word[i] for word in lst]
        dif = {eyes[j] in eyes[:j] for j in range(len(eyes))}
        if True in dif:
            return False
    return True


# Question 5:
def question5(n):
    for i in range(n):
        for j in range(i):
            print(i, j, end=" ")


# We create n+1 iterators

def rec_iter(x):
    if x == 1:
        yield x
        return
    for i in rec_iter(x - 1):
        yield i
    yield x


def question5b(n, m):
    for i in rec_iter(n):
        for j in rec_iter(m):
            print(i, j, end=" ")


# Question 6:
def multi_range(lst):
    def helper(index):
        if index + 1 == len(lst):
            return
        current_item = lst[index]
        next_item = lst[index + 1]
        step = 1 if next_item > current_item else -1
        if current_item != next_item:
            for num in range(current_item, next_item, step):
                yield num
        yield from helper(index + 1)

    return helper(0)


# Or:
def multi_range(lst):
    # Base Case: List too short or empty
    if len(lst) < 2:
        return

    # Iterate through pairs (current, next)
    # We use a loop here instead of recursion for simplicity,
    for i in range(len(lst) - 1):
        start = lst[i]
        end = lst[i + 1]

        # Case 1: Ascending order (start < end)
        if start < end:
            # yield numbers from start up to (but not including) end
            for num in range(start, end, 1):
                yield num

        # Case 2: Descending order (start > end)
        elif start > end:
            # yield numbers from start down to (but not including) end
            for num in range(start, end, -1):
                yield num


# Question 7:
class MyKeyError(Exception):
    pass


class MultiSet:
    def __init__(self):
        self.mapping = {}

    def insert(self, item):
        if item in self.mapping.items():
            self.mapping[item] += 1
        else:
            self.mapping[item] = 1

    def extend(self, iterable):
        for item in iterable:
            self.insert(item)

    def remove(self, item):
        if item not in self.mapping.keys():
            raise MyKeyError()
        self.mapping[item] -= 1
        if self.mapping[item] == 0:
            del self.mapping[item]

    def __repr__(self):
        all_items = []
        for key, value in self.mapping.items():
            all_items.extend([repr(key) * value])

        return "{" + ", ".join(all_items) + "}"

    def __iter__(self):
        for item, count in self.mapping.items():
            for _ in range(count):
                yield
                return item

# Question 8:
def flip(lst, i):
    for j in range((i+1)//2):
        previous = lst[j]
        lst[j] = lst[i - j]
        lst[i-j] = previous

    return lst


def pancake_sort(lst):
    n = len(lst)

    for curr_size in range(n, 1, -1):

        # 1. Find index of the maximum element in the unsorted part (0 to curr_size)
        # We perform a manual search since list.index() is not allowed.
        max_idx = 0
        for i in range(1, curr_size):
            if lst[i] > lst[max_idx]:
                max_idx = i

        # 2. If the max element is not already at the end of the segment, move it.
        if max_idx != curr_size - 1:

            # Step A: Bring the max element to the FRONT (index 0)
            # We only do this if it's not already at index 0.
            if max_idx > 0:
                flip(lst, max_idx)

            # Step B: Flip the entire current segment to move the max element
            # from index 0 to the END (index curr_size - 1).
            flip(lst, curr_size - 1)

    return lst

print(flip([2,1,4,3],2))
print(flip([4,1,2,3],3))
print(flip([3,2,1,4],2))