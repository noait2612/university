#################################################################
# FILE : math_print.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex1 2025
# DESCRIPTION: A simple program that using math module.
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools
# NOTES: ...
#################################################################
import math


#this function prints the golden ratio formula from wikipedia, using math module
def golden_ratio():
    print((1+math.sqrt(5))/2)


#this function prints 6^2 using math module
def six_squared():
    print(math.pow(6,2))


#this function calculate and prints that hypotenuse of a specific triangle using Pythagorean theorem for specific
def hypotenuse():
    print(math.sqrt(math.pow(12,2)+math.pow(5,2)))


#this function prints the value of pi by the import module
def pi():
    print(math.pi)


#this function prints the value of e by the import module
def e():
    print(math.e)


#this function prints the value of the squares areas from 1 to 10.
def squares_area():
    print(math.pow(1,2), math.pow(2,2), math.pow(3,2), math.pow(4,2), math.pow(5,2), math.pow(6,2), math.pow(7,2), math.pow(8,2), math.pow(9,2), math.pow(10,2), )


if __name__ == "__main__" :
    golden_ratio()
    six_squared()
    hypotenuse()
    pi()
    e()
    squares_area()