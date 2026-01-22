from functools import reduce
from typing import *


# Question 1:
def add_largest_digit(n, k):
    if n == 0 or k == 0:
        return 0

    s1 = n % 10 + add_largest_digit(n // 10, k - 1)
    s2 = add_largest_digit(n // 10, k)
    return max(s1, s2)


# Question 2:
def increase_it(nums):
    try:
        k = next(nums)
    except StopIteration:
        return []
    return [k] + increase_it((filter((lambda p: k < p), nums)))


# Question 3
class Link:
    empty = ()

    def __init__(self, value, next=empty):
        self.value = value
        self.next = next

    def __repr__(self):
        pass

    def __str__(self):
        pass

    def __eq__(self, other):
        pass

    def __iter__(self):
        pass


def expend(lnk, times=0):
    if lnk is Link.empty:
        return
    for i in range(times):
        lnk.next = Link(lnk.value, lnk.next)
        lnk = lnk.next
    expend(lnk.next, times + 1)


# Question 7:
def remove_negatives(lst):
    if len(lst) == 0:
        return []
    elif lst[0] < 0:
        return remove_negatives(lst[abs(lst[0]):])
    else:
        return [lst[0]] + remove_negatives(lst[1:])


# Question 8:
class Tree:
    def __init__(self, label, branches=()):
        self.label = label
        self.branches = branches

    def is_leaf(self):
        return not self.branches

    def __repr__(self):
        if self.is_leaf():
            return f'Tree({repr(self.label)})'

        else:
            return f'Tree({repr(self.label)}, {self.branches})'


def sibling_labels(t):
    ans = [b.label for b in t.branches if len(t.branches) > 1]
    for b in t.branches:
        ans.extend(sibling_labels(b))
    return ans


# Question 9:
def increasing_path(t):
    def helper(node, parent_val):
        if node.label <= parent_val:
            return

        if node.is_leaf():
            yield node.label

        for child in node.branches:
            yield from helper(child, node.label)

    yield from helper(t, float('-inf'))


# Question 10:
def max_prefix(n, cond):
    if n < 10:
        return n if cond(n) else 0

    # Recursive Step: Get the valid prefix of the "parent" (n without last digit)
    prefix = max_prefix(n // 10, cond)

    # Logic:
    # 1. Check if the parent prefix was cut short.
    #    If prefix != n // 10, it means a digit to the left failed. We can't continue.
    if prefix != n // 10:
        return prefix

    # 2. If parent was fully valid, check the current digit (n % 10)
    current_digit = n % 10
    if cond(current_digit):
        return prefix * 10 + current_digit
    else:
        return prefix


# Question 11:
def lca(t, label1, label2):
    # 1. Base Case: If the current node is one of the targets, return it.
    if t.label == label1 or t.label == label2:
        return t.label

    # 2. Recursive Step: Search in all branches
    # We collect results that are not None
    found_results = []
    for branch in t.branches:
        res = lca(branch, label1, label2)
        if res is not None:
            found_results.append(res)

    # 3. Decision Logic
    # Case A: We found targets in more than one branch.
    # This implies one target is in one subtree and the other is in another.
    # Therefore, the current node 't' is their Lowest Common Ancestor.
    if len(found_results) >= 2:
        return t.label

    # Case B: We found a result in exactly one branch.
    # This could be one of the targets found deep down, OR the LCA that was
    # already found deeper in the tree and is bubbling up.
    if len(found_results) == 1:
        return found_results[0]

    # Case C: Found nothing in this subtree.
    return None

# Question 12:
def smallest_interleave(a, b):
    # Convert integers to strings to work with digits
    sa, sb = str(a), str(b)

    # Memoization dictionary to store results of (index_a, index_b)
    memo = {}

    def solve(i, j):
        # Check if we already computed this state
        if (i, j) in memo:
            return memo[(i, j)]

        # Base Cases: If one string is empty, return the remainder of the other
        if i == len(sa):
            return sb[j:]
        if j == len(sb):
            return sa[i:]

        # Case 1: Match! (Optimization for Shortest Common Supersequence)
        # If digits match, we consume both to save space (minimize length).
        if sa[i] == sb[j]:
            res = sa[i] + solve(i + 1, j + 1)
            memo[(i, j)] = res
            return res

        # Case 2: Mismatch
        # We try both options: picking from A or picking from B
        option_a = sa[i] + solve(i + 1, j)
        option_b = sb[j] + solve(i, j + 1)

        # Decision Logic:
        # 1. Choose the shorter string (fewer digits = smaller number)
        if len(option_a) < len(option_b):
            res = option_a
        elif len(option_b) < len(option_a):
            res = option_b
        else:
            # 2. If lengths are equal, choose the lexicographically smaller one
            if option_a < option_b:
                res = option_a
            else:
                res = option_b

        memo[(i, j)] = res
        return res

    # Start recursion from index 0, 0
    result_string = solve(0, 0)

    # Convert the resulting string back to an integer
    return int(result_string)


print(smallest_interleave(531, 432))  # Expected: 45312
print(smallest_interleave(531, 4321))  # Expected: 45321
print(smallest_interleave(1234, 9123))  # Expected: 91234 (Overlaps '123')
print(smallest_interleave(0, 321))  # Expected: 321 (String "0321" -> Int 321)
print(smallest_interleave(0, 0))

# Question 13:
def remove_lonely(t: Tree):
    if t is None or t.branches is None:
        return

    for branch in t.branches:
        remove_lonely(branch)

    if len(t.branches) == 1:
        t.branches = t.branches[0].branches


# Question 14:
class PrefixTree:
    def __init__(self, label='', is_word=False):
        self.label = label
        self.is_word = is_word
        self.branches = []

    def __repr__(self):
        parts = [repr(self.label)]
        if self.is_word:
            parts.append('*')
        if self.branches:
            parts.append(repr(self.branches))
        return f"PT({', '.join(parts)})"

    def add_word(self, word):
        # Base Case: We finished adding all letters
        if not word:
            self.is_word = True
            return

        # Recursive Step: Check if the first letter exists in children
        first_char = word[0]
        found_branch = None

        for branch in self.branches:
            if branch.label == first_char:
                found_branch = branch
                break

        # If the letter exists, continue down that path
        if found_branch:
            found_branch.add_word(word[1:])
        else:
            # If not, create a new branch and continue
            new_branch = PrefixTree(first_char)
            self.branches.append(new_branch)
            new_branch.add_word(word[1:])

    def get_words(self, prefix=''):
        # Step 1: Navigate to the node representing the end of the 'prefix'
        current_node = self
        for char in prefix:
            found = False
            for branch in current_node.branches:
                if branch.label == char:
                    current_node = branch
                    found = True
                    break
            if not found:
                return []  # Prefix doesn't exist in tree

        # Step 2: Collect all words starting from this node (DFS)
        all_words = []

        def collect(node, current_suffix):
            # If this node marks the end of a word, add it to results
            if node.is_word:
                all_words.append(prefix + current_suffix)

            # Continue searching in all branches
            for branch in node.branches:
                collect(branch, current_suffix + branch.label)

        collect(current_node, "")
        return all_words
