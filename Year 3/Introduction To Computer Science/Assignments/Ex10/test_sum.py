import numpy
import pytest
from Assignments.Ex10.general_functions_native import *
from Assignments.Ex10.general_functions_vec import *


def test_sum_matrix_naive_1():
    A = [[1, 2, 3],
         [4, 5, 6],
         [7, 8, 9]]

    inner_test_sum_matrix_naive_column(A, [12, 15, 18])
    inner_test_sum_matrix_naive_row(A, [6, 15, 24])


def test_sum_matrix_naive_2():
    D = [[1, 2.5],
         [3, 4.5]]
    inner_test_sum_matrix_naive_column(D, [4, 7.0])
    inner_test_sum_matrix_naive_row(D, [3.5, 7.5])


def test_sum_matrix_naive_3():
    A = [[]]
    inner_test_sum_matrix_naive_column(A, [])
    inner_test_sum_matrix_naive_row(A, [0])


def test_sum_matrix_naive_4():
    A = []
    inner_test_sum_matrix_naive_column(A, [])
    inner_test_sum_matrix_naive_row(A, [])


def test_sum_matrix_vec_1():
    A = numpy.array(
        [[4, 3, 8, 10],
         [6, 0, 5, 14],
         [1, 5, 9, -3]])
    inner_test_sum_matrix_vec_column(A, numpy.array([11, 8, 22, 21]))
    inner_test_sum_matrix_vec_row(A, numpy.array([25, 25, 12]))


def test_sum_matrix_vec_2():
    A = numpy.empty((1, 0))
    inner_test_sum_matrix_vec_column(A, numpy.array([]))
    inner_test_sum_matrix_vec_row(A, numpy.array([0]))


def test_sum_matrix_vec_3():
    A = numpy.empty((0, 0))
    inner_test_sum_matrix_vec_column(A, numpy.array([]))
    inner_test_sum_matrix_vec_row(A, numpy.array([]))


def test_sum_matrix_vec_4():
    A = numpy.array([[1, 2.5],
                     [3, 4.5]])
    inner_test_sum_matrix_vec_column(A, numpy.array([4.0, 7.0]))
    inner_test_sum_matrix_vec_row(A, numpy.array([3.5, 7.5]))


def inner_test_sum_matrix_naive_column(input: List[List[float]], expected: List[float]):
    result = sum_matrix_native(input, 0)
    assert result == expected


def inner_test_sum_matrix_naive_row(input: List[List[float]], expected: List[float]):
    result = sum_matrix_native(input, 1)
    assert result == expected


def inner_test_sum_matrix_vec_column(input: numpy.ndarray, expected: numpy.ndarray):
    result = sum_matrix_vec(input, 0)
    assert numpy.array_equal(result, expected)


def inner_test_sum_matrix_vec_row(input: numpy.ndarray, expected: numpy.ndarray):
    result = sum_matrix_vec(input, 1)
    assert numpy.array_equal(result, expected)
