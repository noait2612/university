import numpy
import pytest
from Assignments.Ex10.general_functions_native import *
from Assignments.Ex10.general_functions_vec import *


def test_eq_native1():
    A = []
    B = []
    assert list_equal(A,B) is True
    assert list_equal(B,A) is True

def test_eq_native2():
    A = [[1, 0], [0, 1]]
    B = []
    assert list_equal(A, B) is False
    assert list_equal(B,A) is False


def test_eq_vec1():
    A = numpy.array([1e10])
    B = numpy.array([1e10 + 100])
    assert ndarray_equal(A, B, eps=1e-6) is False
