from functools import reduce
from typing import *
import pytest


# Only open questions.
# Question 1: sort nodes.
class Node:
    def __init__(self, data=None, next=None):
        self.data, self.next = data, next

    def __repr__(self):
        nodes = []
        current = self
        while current:
            nodes.append(str(current.data))
            current = current.next

        # Join them with arrows to visualize the links
        return " -> ".join(nodes)


class LinkedList:
    def __init__(self, head):
        self.head = head

    def sort(self):
        if self.head is None or self.head.next is None:
            return self.head

        n = 0
        current = self.head
        while current:
            n += 1
            current = current.next

        for _ in range(n):
            prev = None
            curr = self.head
            swapped = False

            while curr and curr.next:
                nxt = curr.next

                # Check if we need to swap
                if curr.data > nxt.data:
                    swapped = True

                    if prev:
                        prev.next = nxt
                    else:
                        self.head = nxt

                    curr.next = nxt.next
                    nxt.next = curr

                    prev = nxt
                else:
                    prev = curr
                    curr = curr.next

            if not swapped:
                break
        return None


# Question 2:
def describe_str(st1):
    if len(st1) == 0:
        return ""

    current_char = st1[0]

    finish_index = same_char_helper(st1, 0)

    return f"{current_char}{finish_index}" + describe_str(st1[finish_index:])


def same_char_helper(s, k):
    count = 1
    start_item = s[k]
    for i in range(k + 1, len(s), 1):
        if start_item == s[i]:
            count += 1
        else:
            return count
    return count


# Question 3:
class Car:
    def __init__(self, size, id):
        self.size, self.id = size, id

    def __repr__(self):
        return str(self.id)


class ParkingLane:
    def __init__(self, length):
        self.park_list = [None for _ in range(length)]

    def insert(self, car: Car):
        for i in range(len(self.park_list) - car.size + 1):
            if self.park_list[i] is None:
                can_place_car = True
                for j in range(1, car.size):
                    if self.park_list[i + j] is not None:
                        can_place_car = False
                        break

                if can_place_car:
                    for j in range(car.size):
                        self.park_list[i + j] = car
                    return True
        return False

    def remove(self, car: Car):
        try:
            start_index = self.park_list.index(car)
        except ValueError:
            return False

        for i in range(car.size):
            self.park_list[start_index + i] = None
        return True

        # Or, less effective:
        if car in self.park_list:
            start_index = 0
            for i in range(len(self.park_list)):
                if self.park_list[i] == car:
                    start_index = i
                    break
            for i in range(car.size):
                self.park_list[start_index + i] = None
            return True

        return False

    def __iter__(self):
        index = 0
        while index < len(self.park_list):
            car = self.park_list[index]
            if car is not None:
                yield car
                index += car.size
            else:
                index += 1


car1 = Car(size=2, id=1)
car2 = Car(size=2, id=2)
car3 = Car(size=3, id=3)
car4 = Car(size=3, id=4)
p = ParkingLane(10)
print(p.insert(car1))
print(p.insert(car2))
print(p.insert(car3))
print(p.remove(car2))
print(p.insert(car4))

print(p.park_list)
for car in p:
    print(car)


# Question 4:
def is_ancestor(child, ancestor):
    # Base Case 1: We found the ancestor!
    if child == ancestor:
        return True

    # Base Case 2: We reached the top of the line without finding them
    if child is None:
        return False

    # Recursive Step: Check mother's side OR father's side
    return is_ancestor(child.mother, ancestor) or \
        is_ancestor(child.father, ancestor)


def family_tree(a, b):
    # Base Case 1: Safety check
    if a is None or b is None:
        return False

    # Check: Is the current person 'a' an ancestor of 'b'?
    # This covers cases where 'a' is 'b', or 'a' is 'b's parent/grandparent,
    # or if we climbed up to a common ancestor.
    if is_ancestor(b, a):
        return True

    # Recursive Step: Climb up 'a's family tree to check parents
    return family_tree(a.mother, b) or family_tree(a.father, b)


# Question 5: reverse list
def rev_list_rec(lst):
    if len(lst) == 0:
        return []
    if len(lst) == 1:
        return lst
    return [lst[-1]] + rev_list_rec(lst[1:-1]) + [lst[0]]


def rev_list(lst):
    rev = [None for _ in range(len(lst))]
    for i in range((len(lst) + 1) // 2):
        first_side = lst[i]
        second_side = lst[len(lst) - i - 1]
        rev[len(lst) - i - 1] = first_side
        rev[i] = second_side

    return rev


lst = ['a', 'b', 3, 5, [1, 2]]
rev_lst = rev_list_rec(lst)
print(lst)
print(rev_lst)
print("New")
print(rev_list(lst))


# Question 6:
def mat_gen():
    counter = 0

    def g(mat):
        nonlocal counter  # 1. Fix scope

        while len(mat) > 0:  # 2. Fix Loop
            if counter % 2 == 0:
                yield mat[0]
                mat.pop(0)
            else:
                col = []
                for row in mat:
                    if len(row) > 0:
                        col.append(row.pop(0))
                yield col

            counter += 1

    return g
