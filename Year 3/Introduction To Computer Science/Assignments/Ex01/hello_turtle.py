#################################################################
# FILE : hello_turtle.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex1 2025
# DESCRIPTION: A simple program that draws ships using turtles!
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools
# NOTES: ...
#################################################################
import turtle


# This function draw a triangle
def draw_triangle():
    """This function does the same action three times: moves forward 45, turns right 120"""
    turtle.forward(45)
    turtle.right(120)
    turtle.forward(45)
    turtle.right(120)
    turtle.forward(45)
    turtle.right(120)


# This function draw a sail
def draw_sail():
    """This function draw the sail by moving left 90, forward 50 and right 150, using the draw_triangle function,
     turns right 30, stop drawing to movie forward 50 and then turns left 90."""
    turtle.left(90)
    turtle.forward(50)
    turtle.right(150)
    draw_triangle()
    turtle.right(30)
    turtle.up()
    turtle.forward(50)
    turtle.down()
    turtle.left(90)


# This function draw a ship
def draw_ship():
    """This function draw the ship:
    we draw the sails by doing the same action 3 times: forward 50 and call draw_sail function.
    then we draw the trapezoid base by turning right 120, forward 20, right 60 and then the same for the other side
    forward 180, right 60, forward 20 and right 120"""
    turtle.forward(50)
    draw_sail()
    turtle.forward(50)
    draw_sail()
    turtle.forward(50)
    draw_sail()
    turtle.forward(50)
    turtle.right(120)
    turtle.forward(20)
    turtle.right(60)
    turtle.forward(180)
    turtle.right(60)
    turtle.forward(20)
    turtle.right(120)

# This function draw two-ship fleet.
def draw_fleet():
    """This function draw the two-ship fleet:
    we draw ship by calling the function draw_ship(),
    the turtle stops drawing to get backward (right from where it stands) 300,
    start drawing again using the draw_ship functions and again stops drawing to return to the origin point
    by going 300 forward (right from where is stands)"""
    draw_ship()
    turtle.up()
    turtle.backward(300)
    turtle.down()
    draw_ship()
    turtle.up()
    turtle.forward(300)
    turtle.down()


if __name__ == "__main__" :
    draw_fleet()
    turtle.done()