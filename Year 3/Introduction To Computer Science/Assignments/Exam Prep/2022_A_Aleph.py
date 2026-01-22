from functools import reduce
from typing import *


class Node:
    def __init__(self, data, left=None, right=None):
        self.data = data
        self.left = left
        self.right = right


def tree_iter(root, depth):
    if root is None or depth <= 0:
        return

    def yield_level(node, current_level, target_level):
        if node is None:
            return

        if current_level == target_level:
            yield node.data
            return

        yield from yield_level(node.left, current_level + 1, target_level)
        yield from yield_level(node.right, current_level + 1, target_level)

    for d in range(depth):
        yield from yield_level(root, 0, d)


def unify(intervals: List[Tuple[float, float]]) -> List[Tuple[float, float]]:
    if len(intervals) == 0:
        return []

    intervals.sort(key=lambda x: x[0])
    merged = []
    current_start, current_end = intervals[0]

    for i in range(1, len(intervals)):
        next_start, next_end = intervals[i]
        if next_start <= current_end:
            current_end = max(next_start, current_end)
        else:
            merged.append((current_start, current_end))
            current_start, current_end = next_start, next_end

    merged.append((current_start, current_end))
    return merged


def is_legal_BST(root: Node) -> bool:
    return is_legal_helper(root, None, None)


def is_legal_helper(root, low, high):
    if root is None:
        return True
    if (low == None or root.data > low) and \
            (high == None or root.data <= high):
        return is_legal_helper(root.left, low, root.data) and \
            is_legal_helper(root.right, root.data, high)
    return False


def is_legal_BST(root) -> bool:
    def validate(node, min_val, max_val):
        if node is None:
            return True

        if not (min_val <= node.data < max_val):
            return False

        return (validate(node.left, min_val, node.data) and
                validate(node.right, node.data, max_val))

    return validate(root, float('-inf'), float('inf'))


def min_time(num_workers: int, tasks: List[float]) -> float:
    tasks.sort(reverse=True)  # Optimization: Process largest tasks first
    workers = [0.0] * num_workers
    best_max = [float('inf')]

    def backtrack(idx):
        if idx == len(tasks):
            current_max = max(workers)
            if current_max < best_max[0]:
                best_max[0] = current_max
            return

        task = tasks[idx]
        for i in range(num_workers):
            # Pruning: If adding this task exceeds best known solution, skip
            if workers[i] + task >= best_max[0]:
                continue

            workers[i] += task
            backtrack(idx + 1)
            workers[i] -= task

            # Optimization: If worker is empty, no need to try subsequent empty workers
            if workers[i] == 0:
                break

    backtrack(0)
    return best_max[0]


class Node:
    def __init__(self, data):
        self.data = data
        self.next = self
        self.prev = self


class Cycle:
    def __init__(self, data):
        self.current = Node(data)

    def insert_next(self, data):
        new_node = Node(data)
        # Wire new_node between current and current.next
        nxt = self.current.next

        self.current.next = new_node
        new_node.prev = self.current

        new_node.next = nxt
        nxt.prev = new_node

    def rotate(self):
        self.current = self.current.next
        return self.current.data

    def rotate_back(self):
        self.current = self.current.prev
        return self.current.data

    def delete(self):
        if self.current.next == self.current:
            raise LookupError("Cannot delete only item")

        prev_node = self.current.prev
        next_node = self.current.next

        prev_node.next = next_node
        next_node.prev = prev_node

        self.current = next_node  # Move to next


def fix(d):
    def decorator(func):
        def wrapper(*args):
            new_args = []
            args_iter = iter(args)

            # We don't know the exact arg count of func, but we must process
            # at least until we cover the max key in d or run out of args.
            i = 0
            while True:
                if i in d:
                    new_args.append(d[i])
                else:
                    try:
                        val = next(args_iter)
                        new_args.append(val)
                    except StopIteration:
                        # No more args provided, and if no more keys in d required, break
                        # However, we must ensure we didn't miss a high index in d
                        if not any(k >= i for k in d):
                            break
                        # If we ran out of args but d has higher keys,
                        # we can't fill the gaps (assuming valid input logic)
                        # or we simply continue checking d.
                i += 1

            return func(*new_args)

        return wrapper
