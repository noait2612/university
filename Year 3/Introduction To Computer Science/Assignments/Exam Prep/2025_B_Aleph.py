from functools import reduce
from typing import *


# Question 1
def n_in_m(n, m):
    if n == m:
        return True
    if n > m: return False
    if n % 10 == m % 10:
        return n_in_m(n // 10, m // 10)
    else:
        return n_in_m(n, m // 10)


# Question 2
class Tree:
    def __init__(self, label, branches=()):
        self.label = label
        self.branches = list(branches)

    def is_leaf(self):
        return not self.branches


def kids(t: Tree, val):
    ans = []
    for b in t.branches:
        if t.label == val:
            ans.append(b)
        ans.extend(kids(t, b))  # since ans=[], it's the same as ans.extend(kids(t,b) if b is not b.is_leaf() else [])

    return ans


# Question 3
class Link:
    empty = ()

    def __init__(self, value, next=empty):
        self.value = value
        self.next = next


def prod_sum(lnk: Link):
    if lnk is Link.empty:
        return 0
    elif lnk.next is Link.empty:
        return lnk.value
    else:
        return (lnk.value * lnk.next.value) + prod_sum(lnk.next.next)


# Question 4 with Tree as above
def new_leaves(t: Tree, leaves):
    if t.is_leaf():
        return Tree(t.label, [Tree(i) for i in leaves])
    return Tree(t.label, [new_leaves(b, leaves) for b in t.branches])


# Queestion 5
def any_swap(lst, n, m, k=0):
    if len(lst) == k:
        return []
    else:
        swap_dict = {n: lst[m], m: lst[n]}
        curr = swap_dict.get(k)
        return ([curr] if curr is not None else [lst[k]]) + any_swap(lst, n, m, k + 1)

# Question 9
class Tree:
    def __init__(self, label, branches=()):
        self.label = label
        self.branches = list(branches)
    def is_leaf(self):
        return not self.branches
    def __repr__(self):
        if self.is_leaf():
            return f'Tree({repr(self.label)})'
        else:
            return f'Tree({repr(self.label)}, {self.branches})'


def tree_replace(tr1, tr2, val):
    if tr1 is None or tr2 is None:
        return

    for branch in tr1.branches:
        if branch.label == val:
            branch.label = tr2.label
            branch.branches = tr2.branches
            break
        else:
            tree_replace(branch, tr2, val)

#Question 10
def make_n(digits, n):
    # Helper function for recursion
    # index: current position in the string 'digits'
    # current_sum: the mathematical result we have calculated so far
    def backtrack(index, current_sum):

        # --- 1. Base Case ---
        # If we have used all digits, check if the sum equals the target 'n'
        if index == len(digits):
            return current_sum == n

        # --- 2. Recursive Step ---
        # We try to slice the string into a new number of every possible length.
        # We start from 'index' and go to the end of the string.
        for i in range(index, len(digits)):
            # Create a substring from index to i.
            # e.g., if digits="453", index=0, i=0 -> substring="4"
            substring = digits[index: i + 1]

            # Convert that substring to an integer
            value = int(substring)

            # Special Handling for the FIRST number
            # The problem allows "-4+5...", so the first number can be negative or positive.
            # It cannot be "added" to a previous sum because there is no previous sum.
            if index == 0:
                # Option A: Start with positive (e.g., "4...")
                if backtrack(i + 1, value):
                    return True
                # Option B: Start with negative (e.g., "-4...")
                if backtrack(i + 1, -value):
                    return True

            # Handling for all SUBSEQUENT numbers
            else:
                # Option A: Add the number (+ value)
                if backtrack(i + 1, current_sum + value):
                    return True
                # Option B: Subtract the number (- value)
                if backtrack(i + 1, current_sum - value):
                    return True

        # --- 3. Dead End ---
        # If we tried all splits and all signs and nothing worked, return False.
        return False

    # Start the recursion from index 0 with a sum of 0
    return backtrack(0, 0)


# Question 11
def max_depth(t, val):
    def helper(t, val, k):
        if t.branches is None:
            if k == 0:
                return None
            return k

        if t.label == val:
            k += 1

        for branch in t.branches:
            inner = helper(branch, val, 0)
            if inner is not None:
                k += inner

        if k == 0:
            return None
        return k

    return helper(t, val, 0)


# Question 12
def max_separated_sublist_sum(lst):
    if len(lst) == 0:
        return 0

    sublists = get_all_separated_sublists(lst)
    max_sum = 0
    for sublist in sublists:
        sublist_sum = sum(sublist)
        temp = max_sum
        max_sum = max(sublist_sum, temp)

    return max_sum

def get_all_separated_sublists(lst):
    all_sublists = []

    def backtrack(index, current_sublist):
        # Base Case: We've gone past the end of the list
        if index >= len(lst):
            all_sublists.append(current_sublist)
            return

        # Option 1: Include the current element
        backtrack(index + 2, current_sublist + [lst[index]])

        # Option 2: Exclude the current element
        backtrack(index + 1, current_sublist)

    backtrack(0, [])
    return all_sublists

# Question 13
def semi_perfect(n):
    if n<=5:
        return False

    divisors = {1}
    step = 2 if n % 2 == 1 else 1  # Optimization: skip evens if n is odd

    for i in range(2, int(n ** 0.5) + 1, step):
        if n % i == 0:
            divisors.add(i)
            divisors.add(n // i)

    if sum(divisors) < n:
        return False
    reachable_sums = {0}

    # Sorting descending helps us reach larger numbers (like n) faster
    sorted_divs = sorted(list(divisors), reverse=True)

    for d in sorted_divs:
        # We create a new set for sums created in this iteration
        # to avoid modifying the set while iterating
        current_step_sums = set()

        for s in reachable_sums:
            new_sum = s + d

            if new_sum == n:
                return True

            # Pruning: Don't store sums that already exceed n
            if new_sum < n:
                current_step_sums.add(new_sum)

        reachable_sums.update(current_step_sums)

    return False

# Question 14
class Library:
    ...

    def checkout_book(self, book_id):
        """Check out a book by ID
        psuedo-code:
        Try to checkout book and return True if successful else False
        """
        ...

    def return_book(self, book_id):
        """Return a book by ID
        psuedo-code:
        Try to return book and return True if successful else False
        """
        ...

class Subscriptions:
    def __init__(self, library):
        self.library = library
        self.subscriptions = {}
        self.subscription_to_books = {}
        self.book_to_user = {}

    """ create a Subscription object for a library
    לספריה רישום מערכת מייצר
    """
    def add_user(self, user_id, name):
        if self.subscriptions.get(user_id) is not None:
            return False

        self.subscriptions[user_id]=name
        self.subscription_to_books[user_id] = []
        return True

    def user_checkout_book(self, user_id, book_id):
        if self.subscriptions.get(user_id) is None:
            return False

        if self.library.checkout_book(book_id):
            self.subscription_to_books[user_id].append(book_id)
            self.book_to_user[book_id] = user_id
            return True

        return False

    def return_book(self, book_id):
        if book_id not in self.book_to_user:
            return False

        user_id = self.book_to_user[book_id]
        if self.library.return_book(book_id):
            self.subscription_to_books[user_id].remove(book_id)
            del self.book_to_user[book_id]
            return True

        return False


    def user_books(self, user_id):
        if self.subscriptions.get(user_id) is None:
            raise KeyError("User id not exists")

        return self.subscription_to_books[user_id]