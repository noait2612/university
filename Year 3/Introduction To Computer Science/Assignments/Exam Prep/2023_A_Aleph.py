def cache(fun):
    flag = False
    c = {}
    def result_fun(*args, **keywords):
        nonlocal flag
        nonlocal c
        if "use_cache" in keywords.keys():
            flag = keywords["use_cache"]

        if flag:
            if args not in c.keys():
                result = fun(*args)
                c[args] = result
                return result

            return c[args]

        result = fun(*args)
        c[args]=result
        return result

    return result_fun


@cache
def f(n):
    print("Bla")
    sum = 0
    for i in range(n):
        sum+= i**2
    return sum


def exponent(x,n):
    if n == 0:
        return 1

    result = 1
    for i in range(1, (n//2)+1):
        result = result * x

    result = result * result
    if n % 2 != 0:
        result = result * x

    return result


def mb_fib(n):
    def helper(a,b,c, index):
        if index == n:
            return c

        return helper(b,c, a*b*c, index+1)

    if n == 1:
        return 1
    if n == 2:
        return 2
    if n == 3:
        return 6

    return helper(1,2,3,3)


class TextDoc:
    def __init__(self):
        self.lines = [""]
        self.row = 0
        self.col = 0

    def move_caret(self, row, col):
        if not (0<=row<=len(self.lines)):
            raise ValueError(f"Line {row} not exists")

        if not (0<=col<=len(self.lines[row])):
            raise ValueError(f"column {col} is invalid")

        self.row = row
        self.col = col

    def type_in(self, char):
        line = self.lines[self.row]
        if char == '\n':
            first_part = line[:self.col]
            second_part = line[self.col:]

            self.lines[self.row] = first_part
            self.lines.insert(self.row+1, second_part)

            self.row += 1
            self.col += 1
        else:
            self.lines[self.row] = line[:self.col]+char+line[self.col:]
            self.col += 1

    def get_current_line(self):
        return self.lines[self.row]


class Node:
    def __init__(self, data, rep, child):
        self.data = data
        self.rep = rep
        self.child = child


def compress(head: Node):
    current = head
    while current is not None and current.next is not None:
        if current.data == current.next.data:
            current.rep += current.next.rep
            current.next = current.next.next
        else:
            current = current.next

    return None



from typing import List, Set, Tuple, Optional

def assign(n: int, k: int, hate: Set[Tuple[int, int]]) -> Optional[List[List[int]]]:
    tables = [[] for _ in range(k)]
    
    def can_sit(person, current_table):
        for seated_person in current_table:
            if (person, seated_person) in hate or (seated_person, person) in hate:
                return False
        return True

    def backtrack(person_id):
        if person_id == n:
            return tables
        
        for i in range(k):
            if can_sit(person_id, tables[i]):
                tables[i].append(person_id)
                
                result = backtrack(person_id + 1)
                
                if result is not None:
                    return result
                
                tables[i].pop()
        
        return None

    return backtrack(0)




print(f(1000))
print(f(100))
print(f(1000, use_cache=True))
print(f(100))
print(f(1000, use_cache = False))
print(f(100))
