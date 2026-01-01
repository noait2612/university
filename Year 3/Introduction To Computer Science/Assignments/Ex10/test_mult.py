import numpy
import pytest
from Assignments.Ex10.general_functions_native import *
from Assignments.Ex10.general_functions_vec import *

A = numpy.zeros((0, 4))  # cant be represented in python native
B = numpy.ones((4, 0))
C = numpy.zeros((0, 0))
D = numpy.ones((4, 4))


def test_mult_matrix_naive_1():
    A = [[1, 2, 3],
         [4, 5, 6]]  # 2×3
    B = [[7, 8],
         [9, 10],
         [11, 12]]  # 3×2
    inner_test_mult_matrix_naive(A, B, [[58, 64], [139, 154]])


def test_mult_matrix_naive_2():
    A = [[5]]  # 1×1
    B = [[3]]  # 1×1
    inner_test_mult_matrix_naive(A, B, [[15]])


def test_mult_matrix_naive_3():
    A = [[1, 2.0]]  # 1×2
    B = [[3], [4]]  # 2×1
    inner_test_mult_matrix_naive(A, B, [[11.0]])


def test_mult_matrix_naive_4():
    A = [[], [], []]  # 3×0
    B = []  # 0×0
    inner_test_mult_matrix_naive(A, B, [[], [], []])


def test_mult_matrix_naive_5():
    A = [[1, 2, 3]]  # 1×3
    B = [[4, 5]]  # 1×2
    inner_test_fail_mult_matrix_naive(A, B)


def test_mult_matrix_naive_6():
    A = [[]]  # 1×0
    B = []  # 0×0
    inner_test_mult_matrix_naive(A, B, [[]])


def test_mult_matrix_naive_7():
    A = [[1, 2],
         [3, 4],
         [5, 6]]  # 3×2
    B = [[], []]  # 2×0
    inner_test_mult_matrix_naive(A, B, [[], [], []])


def test_mult_matrix_naive_8():
    A = []  # 0x0
    B = []  # 0x0
    inner_test_mult_matrix_naive(A, B, [])


def test_mult_matrix_vec_1():
    inner_test_mult_matrix_vec(A, B, (0, 0), [])


def test_mult_matrix_vec_2():
    inner_test_mult_matrix_vec(B, A, (4, 4), [[0.0, 0.0, 0.0, 0.0],
                                              [0.0, 0.0, 0.0, 0.0],
                                              [0.0, 0.0, 0.0, 0.0],
                                              [0.0, 0.0, 0.0, 0.0]])


def test_mult_matrix_vec_3():
    inner_test_mult_matrix_vec(B, C, (4, 0), [[], [], [], []])


def test_mult_matrix_vec_4():
    inner_test_mult_matrix_vec(D, B, (4, 0), [[], [], [], []])


def test_mult_matrix_vec_5():
    inner_test_fail_mult_matrix_vec(B, D)


def test_mult_matrix_vec_6():
    inner_test_fail_mult_matrix_vec(A, C)


def inner_test_mult_matrix_naive(A: List[List[float]], B: List[List[float]], expected: List[List[float]]):
    result = mul_mat_native(A, B)
    assert result == expected


def inner_test_fail_mult_matrix_naive(A: List[List[float]], B: List[List[float]]):
    with pytest.raises(ValueError) as exc_info:
        mul_mat_native(A, B)
        assert str(exc_info.value) == "Matrix dimensions are incompatible"


def inner_test_mult_matrix_vec(A: numpy.ndarray, B: numpy.ndarray, expected_shape: tuple[int, int],
                               expected_content: list) -> None:
    result = mul_mat_vec(A, B)
    assert numpy.array_equal(result.shape, expected_shape)
    assert result.tolist() == expected_content


def inner_test_fail_mult_matrix_vec(A: numpy.ndarray, B: numpy.ndarray):
    with pytest.raises(ValueError) as exc_info:
        mul_mat_vec(A, B)
        assert str(exc_info.value) == "Matrix dimensions are incompatible"
