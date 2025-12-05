#################################################################
# FILE : ex7.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex7 2025
# DESCRIPTION: A simple program that contains multiple recursion functions.
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools, docs.python.org
# NOTES: ...
#################################################################
from typing import Any
from ex7_helper import *


# Recursion function that preform multiplication of two numbers.
def mult(x: N, y: int) -> N:
    if y == 0:
        return 0
    return add(x, mult(x, subtract_1(y)))


def is_even(n: int) -> bool:
    if n == 0:
        return True
    return not is_even(subtract_1(n))


# doing as the example in the lecture for power series but for multiplication
def log_mult(x: N, y: int) -> N:
    if y == 0:
        return 0
    elif y == 1:
        return x
    elif y == 2:
        return add(x, x)
    # If I'm even I add myself
    if not is_odd(y):
        inner_mult = log_mult(x, divide_by_2(y))
        return add(inner_mult, inner_mult)
    else:
        divided_by_2 = divide_by_2(y)
        return add(log_mult(x, divided_by_2), add(x, divided_by_2))


#Get the value of the n-th element in ayalacci series.
def ayalacci(n: int) -> int:
    previous, current = ayalacci_helper(n)
    return current


#Helper function as we saw in lecture to better performance
def ayalacci_helper(n: int):
    if n == 1:
        return 1, 1

    previous, current = ayalacci_helper(n - 1)
    if is_odd(current):
        next = current + previous - current // 2
    else:
        next = current + previous + 1
    return current, next


# We can't use slicing and only using append_to_end function, s[i] and len(s)
def reverse(s: str) -> str:
    return transform_reverse(s, "", 0)


#Reverse using indices.
def transform_reverse(s: str, reversed_s: str, index: int) -> str:
    if len(s) == index:
        return ""

    return append_to_end(transform_reverse(s, reversed_s, index + 1), s[index])

#Solve the Hanoi game.
def play_hanoi(hanoi: Any, n: int, src: Any, dest: Any, temp: Any):
    if n < 1:
        return

    if n == 1:
        hanoi.move(src, dest)
    else:
        # To move all n-1 rings to the helper rod
        play_hanoi(hanoi, n - 1, src, temp, dest)
        # To move the biggest ring
        hanoi.move(src, dest)
        # Move the n-1 rings back to the dest
        play_hanoi(hanoi, n - 1, temp, dest, src)


# This function gets a number and count the number of ones from 1 to this number (for 13, we'll get 6).
def number_of_ones(n: int) -> int:
    if n == 0:
        return 0
    if n == 1:
        return 1
    ones = count_number_of_ones_in_number(n)
    return ones + number_of_ones(n - 1)


# This function gets a number and count it's number of ones in this specific number
def count_number_of_ones_in_number(n: int) -> int:
    if n == 0:
        return 0
    if n == 1:
        return 1
    if n % 10 == 1:
        return 1 + count_number_of_ones_in_number(n // 10)
    else:
        return count_number_of_ones_in_number(n // 10)

#Compare two 2d lists.
def compare_2d_lists(l1: list[list[int]], l2: list[list[int]]) -> bool:
    if len(l1) != len(l2):
        return False

    return compare_2d_lists_by_index(l1, l2, 0)

#Compare two 2d lists by recursion, by movies on all it's indices and using compares on the inner lists
def compare_2d_lists_by_index(l1: list[list[int]], l2: list[list[int]], index: int) -> bool:
    if index == len(l1) and index == len(l2):
        return True

    inner_list1 = l1[index]
    inner_list2 = l2[index]

    if len(inner_list1) != len(inner_list2):
        return False

    if not compare_1d_lists(inner_list1, inner_list2, 0):
        return False

    return compare_2d_lists_by_index(l1, l2, index + 1)

#Compare two 1d lists by recursion, by movies on all it's indices
def compare_1d_lists(l1: list[int], l2: list[int], index: int) -> bool:
    if index == len(l1) and index == len(l2):
        return True

    if l1[index] != l2[index]:
        return False

    return compare_1d_lists(l1, l2, index + 1)


# This is like the set omega in Set Theory
def magic_list(n: int) -> list[Any]:
    if n == 0:
        return []
    return [magic_list(n - 1)] + magic_list(n - 1)
