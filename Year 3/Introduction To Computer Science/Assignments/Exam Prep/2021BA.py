
class Node:
    def __init__(self, data=None, next=None):
        self.data = data
        self.next = next


def linked_filter(f, lnk: Node):
    if lnk.data is None and lnk.next is None:
        return None

    head = tail = None
    current = lnk

    while current:
        if f(current.data):
            new_node = Node(current.data)
            if head is None:
                head = tail = new_node
            else:
                tail.next = new_node
                tail = new_node
        current = current.next

    return head


def all_sums(num, bound):
    for a in range(1, bound + 1):
        b = num - a
        if 1 <= b <= bound:
            yield f"{a}+{b}"


def f3(n, x, y):
    if n == 0:
        return [[]]
    smaller = f3(n - 1, x, y)
    result = []
    for sub in smaller:
        result.append(sub + [x])
        if not sub or sub[-1] != y:
            result.append(sub + [y])

    return result

def rotate_90_clock(mat):
    rows = len(mat)
    columns = len(mat[0])
    new_mat = []
    for c in range(columns):
        new_row = []
        for r in range(rows-1,-1,-1):
            new_row.append(mat[r][c])
        new_mat.append(new_row)

    return new_mat


class Campus:
    def __init__(self):
        # Initialize an empty dictionary to store students and their friends (sets)
        self.classmates = {}

    def add_classmate(self, st1, st2):
        # If student is not in dictionary, add them with an empty set
        if st1 not in self.classmates:
            self.classmates[st1] = set()
        if st2 not in self.classmates:
            self.classmates[st2] = set()

        # Add each student to the other's set of friends (undirected graph)
        self.classmates[st1].add(st2)
        self.classmates[st2].add(st1)

    def soc_dist(self, st1, st2, n):
        # Requirement: If students are identical, return True for any n
        if st1 == st2:
            return True

        # Requirement: If either student is not in the dictionary, return False
        if st1 not in self.classmates or st2 not in self.classmates:
            return False

        # Use Breadth-First Search (BFS) to find the shortest path (social distance)
        queue = [(st1, 0)]  # Store tuples of (current_student, current_distance)
        visited = {st1}  # Keep track of visited students to avoid cycles

        while queue:
            current_student, dist = queue.pop(0)

            # If we found the target student
            if current_student == st2:
                # Check if the shortest distance found is exactly n
                return dist == n

            if dist == n:
                continue

            # Add neighbors to the queue
            for neighbor in self.classmates[current_student]:
                if neighbor not in visited:
                    visited.add(neighbor)
                    queue.append((neighbor, dist + 1))

        return False


def f4(st, dict1, k):
    memo = {}
    n = len(st)

    def dp(idx, count, consecutive_run):
        # Base Case 1: Successfully collected k characters
        if count == k:
            return 0, ""  # Score 0 (added to previous), empty string suffix

        # Base Case 2: Reached end of string without collecting k characters
        if idx == n:
            return float('-inf'), ""  # Impossible path

        state = (idx, count, consecutive_run)
        if state in memo:
            return memo[state]

        # --- Option 1: Skip the current character ---
        # If we skip, the consecutive run breaks, so it resets to 0.
        score_skip, str_skip = dp(idx + 1, count, 0)

        # --- Option 2: Pick the current character ---
        score_pick = float('-inf')
        str_pick = ""

        # We can only pick if it doesn't complete a full contiguous block of size k.
        # This happens if we have already picked k-1 consecutive items immediately before this.
        can_pick = True
        if count == k - 1 and consecutive_run == k - 1:
            can_pick = False

        if can_pick:
            # If we pick, count increases, and the consecutive run extends by 1
            next_score, next_str = dp(idx + 1, count + 1, consecutive_run + 1)

            if next_score != float('-inf'):
                current_char_val = dict1[st[idx]]
                score_pick = current_char_val + next_score
                str_pick = st[idx] + next_str

        # --- Decision: Take the path with the higher score ---
        if score_pick >= score_skip:
            result = (score_pick, str_pick)
        else:
            result = (score_skip, str_skip)

        memo[state] = result
        return result

    # Start the recursion
    final_score, final_string = dp(0, 0, 0)

    # If no valid string was found (should not happen based on problem constraints)
    if final_score == float('-inf'):
        return None

    return final_string

if __name__ == "__main__":
    print(rotate_90_clock([[1,2],[3,4],[5,6]]))
