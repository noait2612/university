import numpy
import pytest
from Assignments.Ex10.general_functions_native import *
from Assignments.Ex10.general_functions_vec import *

def test_inverse_matrix_naive_1():
    A = [[1, -1],
         [-1, 2]]
    B = [[2, 1],
         [1, 1]]
    inner_test_inverse_matrix_naive(A, B, True)


def test_inverse_matrix_naive_2():
    A = [[4, 3, 8],
         [6, 2, 5],
         [1, 5, 9]]
    B = [[-0.14285714, 0.26530612, -0.02040816],
         [-1, 0.57142857, 0.57142857],
         [0.57142857, -0.34693878, -0.20408163]]
    inner_test_inverse_matrix_naive(A, B, True)


def test_inverse_matrix_naive_3():
    A = [[4, 3, 8],
         [6, 2, 5],
         [1, 5, 9]]
    B = [[0, 1, 2],
         [3, 4, 5],
         [6, 7, 8]]
    inner_test_inverse_matrix_naive(A, B, False)


def test_inverse_matrix_naive_4():
    A = [[1, 0.1], [0, 1]]
    x = 0.3 - 0.2
    B = [[1, -x], [0, 1]]
    inner_test_inverse_matrix_naive(A, B, False, 0.0)


def test_inverse_matrix_naive_5():
    A = [[1, 0.1], [0, 1]]
    x = 0.3 - 0.2
    B = [[1, -x], [0, 1]]
    inner_test_inverse_matrix_naive(A, B, True)


def test_inverse_matrix_vec_1():
    A = numpy.array(
        [[4, 3, 8],
         [6, 2, 5],
         [1, 5, 9]])
    B = numpy.array(
        [[-0.14285714, 0.26530612, -0.02040816],
         [-1, 0.57142857, 0.57142857],
         [0.57142857, -0.34693878, -0.20408163]])
    inner_test_inverse_matrix_vec(A, B, True)


def test_inverse_matrix_vec_2():
    A = numpy.array(
        [[4, 3, 8],
         [6, 2, 5],
         [1, 5, 9]])
    B = numpy.array(
        [[0, 1, 2],
         [3, 4, 5],
         [6, 7, 8]])
    inner_test_inverse_matrix_vec(B, A, False)


def test_inverse_matrix_vec_3():
    A = numpy.array([[1.0, 0.1],
                  [0.0, 1.0]])
    x = 0.3 - 0.2  # 0.09999999999999998...
    B = numpy.array([[1.0, -x],
                  [0.0, 1.0]])
    inner_test_inverse_matrix_vec(A, B, False, 0.0)


def test_inverse_matrix_vec_4():
    A = numpy.array([[1.0, 0.1],
                     [0.0, 1.0]])
    x = 0.3 - 0.2  # 0.09999999999999998...
    B = numpy.array([[1.0, -x],
                     [0.0, 1.0]])
    inner_test_inverse_matrix_vec(A, B, True)


def inner_test_inverse_matrix_naive(A: List[List[float]], B: List[List[float]], expected: bool, eps: float = 1e-6):
    result = is_inverse_native(A, B, eps)
    assert result == expected


def inner_test_inverse_matrix_vec(A: numpy.ndarray, B: numpy.ndarray, expected:bool, eps: float = 1e-6):
    result = is_inverse_vec(A, B, eps)
    assert result == expected
