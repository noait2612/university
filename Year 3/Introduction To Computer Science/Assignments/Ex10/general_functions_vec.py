#################################################################
# FILE : general_functions_vec.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex10 2025
# DESCRIPTION: A class that implements numpy matrix wrapper functions.
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: numpy.org
# NOTES: ...
#################################################################
import numpy


def ndarray_equal(A: numpy.ndarray, B: numpy.ndarray, eps: float = 1e-6) -> bool:
    if A.shape != B.shape:
        return False

    return numpy.allclose(A, B, atol = eps, rtol = 0) # atol is for The absolute tolerance parameter.


def sum_matrix_vec(A: numpy.ndarray, axis: int) -> numpy.ndarray:
    return numpy.sum(A, axis=axis)


def mul_mat_vec(A: numpy.ndarray, B: numpy.ndarray) -> numpy.ndarray:
    if A.shape[1] != B.shape[0]:
        raise ValueError("Matrix dimensions are incompatible")

    return A @ B  # The @ operator can be used as a shorthand for np.matmul on ndarrays.


def is_inverse_vec(A: numpy.ndarray, B: numpy.ndarray, eps: float = 1e-6) -> bool:
    if A.size == 0:
        return B.size == 0

    if B.size == 0:
        return False

    if A.shape[0] != A.shape[1] or B.shape[0] != B.shape[1] or A.shape != B.shape:
        return False

    if A.shape[0] == 0 or B.shape[0] == 0:
        return False

    multiplied_matrix = mul_mat_vec(A, B)
    identity_matrix = numpy.identity(len(A))
    return ndarray_equal(multiplied_matrix, identity_matrix, eps)
