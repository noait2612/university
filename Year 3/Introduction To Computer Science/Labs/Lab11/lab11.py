from functools import *


def count_appearances1(letter, word):
    fun = lambda acc, char: acc + 1 if char == letter else acc
    return reduce(fun, word, 0)


def count_appearances2(letter, word):
    fun = lambda char: 1 if char == letter else 0
    return sum(map(fun, word))


def count_appearances3(letter, word):
    fun = lambda char: char == letter
    return len(list(filter(fun, word)))



def last_in():
    previous = None

    def inner(x):
        nonlocal previous
        result = previous
        previous = x
        return result

    return inner

last_in = last_in()

def example():
    f = lambda x, y: [x, y]
    g = lambda x: -x if x % 2 != 0 else x
    print(reduce(f, map(g, range(6))))


def minus_one_func():
    return lambda x: x - 1


def to_curry(f):
    def builder(*current_args):
        def wrapper(*next_args):
            if not next_args:
                return f(*current_args)
            else:
                return builder(*(current_args + next_args))

        return wrapper

    return builder()


if __name__ == "__main__":
    # f = lambda x, y, z, w: (x, y, z, w)
    # print(to_curry(f)(1)(2)(3)(4)())
    # print(to_curry(f)(1, 2)(3, 4)())
    # print(to_curry(f)(1)(2, 3)(4)())
    print(last_in(3), last_in(4), last_in(5), last_in("a"), last_in("12"))
