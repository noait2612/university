import functools
import typing
from typing import *
import pytest


# Question 1:
def add1(tpl):
    if len(tpl) == 0:
        return 0
    if len(tpl) == 1:
        return tpl[0]
    else:
        return tpl[0] + add1(tpl[1:-1]) + tpl[-1]


# This is O(n^2) since we call to add1 once with n elements, once with n-2 elements etc so with acts like n^2~

def add2(tpl):
    if len(tpl) == 0:
        return 0
    elif len(tpl) == 1:
        return tpl[0]
    else:
        mid = len(tpl) // 2
        return add2(tpl[:mid]) + add2(tpl[mid:])


# We call to add2 once with n elements, then with n//2 elements, then with n//4 elements so it acts like geometric series 1/2^n that converges to
# But each time with cut the mid in half, so it acts like O(n log n)

# Question 2:
doohickey = lambda f: lambda *kargs, **kwargs: 6  # Since we want to cancel func1, funct2 so this is a decorator


@doohickey
def func1(a, b, c=None):
    if a > b:
        return c


@doohickey
def funct2(g, e):
    return str(g + e) + "hello!"


# Question 3
def even_odd(lst):
    return list(filter(lambda x: x % 2 == 0, lst)) + list(filter(lambda x: x % 2 == 1, lst))


# Or
def even_odd2(lst):
    return [x for x in lst if x % 2 == 0] + [x for x in lst if x % 2 == 1]


# Question 4
def question4():
    n = 3
    source = [1, 2]
    source[1] = source
    x = [[source[:] for i in range(n)] for j in range(n)]
    y = [z[:] for z in x]


# x contains n^2+n+2 lists
# y contains n+1 lists

# Question 5
def rotate(s, d):
    x = s[:len(s) - d]
    y = s[len(s) - d:]
    return y + x


# Questi    on 6
def depth_check(f):
    depth = [0, 0]

    @functools.wraps(f)
    def helper(*args, **kwargs):
        depth[0] += 1
        depth[1] = max(depth)
        res1 = f(*args, **kwargs)
        depth[0] -= 1
        if depth[0] == 0:
            res2 = depth[1]
            depth[1] = 0
            return res1, res2
        return res1

    return helper


# Or
def depth_check(f):
    def wrapper(*args, **kwargs):
        # 1. Check if we are starting a new top-level call
        if wrapper.depth == 0:
            wrapper.max_depth = 0

        # 2. Update state for the current call
        wrapper.depth += 1
        wrapper.max_depth = max(wrapper.max_depth, wrapper.depth)

        # 3. Execute the original function
        # We use try/finally to ensure depth is decremented even if an error occurs
        try:
            res = f(*args, **kwargs)
        finally:
            wrapper.depth -= 1

        # 4. Return logic
        # If we are back at the top (depth 0), return the tuple
        if wrapper.depth == 0:
            return (res, wrapper.max_depth)
        # Otherwise, just return the result so the recursion math works
        else:
            return res

    # Initialize the state variables on the wrapper function
    wrapper.depth = 0
    wrapper.max_depth = 0

    return wrapper


# Question 7:
class Node:
    def __init__(self, data, left=None, right=None):
        self.data = data
        self.left = left
        self.right = right


def find_path(root: Node, k):
    if root is None:
        return None

    if root.left is None and root.right is None:
        if root.data == k:
            return [root.data]
        else:
            return None

    reminder = k - root.data
    res = find_path(root.left, reminder)
    if res is not None:
        return [root.data] + res

    res = find_path(root.right, reminder)
    if res is not None:
        return [root.data] + res

    return None


node = Node(1, left=Node(2, left=Node(8), right=Node(0, right=Node(9))),
            right=Node(-7, left=Node(5, left=Node(0), right=Node(9)), right=Node(4, right=Node(-3))))
print(find_path(node, 8))  # Should be [1,-7,5,9]

print(find_path(node, -1))  # Should be [1,-7,5,0]
print(find_path(None, 1))  # Should be None


class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age
        self.vac_count = 0
        self.spouse = None

    def get_vac_num(self):
        return self.vac_count

    def set_vac_num(self, vac_num):
        self.vac_count = vac_num

    def get_age(self):
        return self.age

    def get_name(self):
        return self.name

    def marry(self, spouse):
        if spouse is None or (self.spouse is not None and self.spouse != spouse) or (
                spouse.get_spouse() is not None and self != spouse.get_spouse()):
            raise Exception("")

        if self.spouse is None:  # We do the check to not going into StackOverflow
            self.spouse = spouse
            spouse.marry(self)

    def get_spouse(self):
        return self.spouse


class VaccinationCenter:
    vaccine_total = 50

    def __init__(self, min_age):
        self.min_age = min_age

    def set_age_limit(self, min_age):
        self.min_age = min_age

    def give_vaccine(self, person):
        if self.is_eligible(person):
            self.vaccine_total -= 1
            person.set_vac_num(person.get_vac_num() + 1)
            return True
        else:
            return False

    def is_eligible(self, person: Person):
        if VaccinationCenter.vaccine_total > 0:
            if person.get_age() >= self.min_age:
                return True
            if person.get_vac_num() > 0:
                return True
            else:
                spouse = person.get_spouse()
                if spouse is not None:
                    return spouse.get_vac_num() > 0
                else:
                    return False
        else:
            return False


# Question 1:
def question1():
    lst1 = [(5, 2), 0, "-7", 4, 8]
    lst2 = [1, 2, 3, 4, 5]
    try:
        for item in lst1:
            try:
                print(int(lst2[item] / item), end=" ")  # This is my answer.
            except TypeError:
                print("a", end=" ")
            except ZeroDivisionError:
                print("b", end=" ")
            except IndexError:
                print("c", end=" ")
    except:
        print("e", end=" ")
    finally:
        print("f", end=" ")


# Question 2:
def t(n):
    if n <= 0:
        return 0
    else:
        return 1 + t((n - 1) // 2)


print([t(i) for i in range(18)])  # Should return [0, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4]


# Question 3:
def question3():
    x = [[3, 2], [4, 5], [8, 1], [9, 3]]
    y = [item for sublist in x for item in
         sublist]  # My answer, we do for sublist in x, and from each sublist we take item from sublist
    print([[a, b, c, d] for a, b, c, d in [y[3:7]]])


# Question 6:
def get_ingredients(final_item, recipes):
    products = set()
    for _, output in recipes:
        for product in output:
            product.add(product)

    def find_base(item):
        if item not in products: #Base case, this is basic ingredient
            return {item}

        for input, output in recipes:
            if item in output:
                needed = set()
                for ingredient in input:
                    needed.update(ingredient)
                return needed
        return {item}

    return find_base(final_item)

#  Question 7:
def find_max_prefix_sum(lst):
    return _prefix_sum_helper(lst, 0, 0)[1]

def _prefix_sum_helper(lst, ind, sum_to_ind):
    if ind >= len(lst):
        return sum_to_ind, ind
    new_sum, new_ind = _prefix_sum_helper(lst, ind+1, sum_to_ind + lst[ind])
    if sum_to_ind >= new_sum:
        return sum_to_ind, ind
    else:
        return new_sum, new_ind