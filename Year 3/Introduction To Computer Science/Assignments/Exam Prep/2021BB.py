def f1(x,y):
    if x==y:
        return True
    if x>y:
        return False
    if x%10 == y%10:
        return f1(x//10, y//10)
    else:
        return f1(x,y//10)


if __name__ == "__main__":
    print(list(map(f1, [23], (4253,))))