#################################################################
# FILE : general_functions_native.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex10 2025
# DESCRIPTION: A class that implements matrix functions without numpy.
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools, docs.python.org
# NOTES: ...
#################################################################
from typing import List


def list_equal(A: List[List[float]], B: List[List[float]], eps: float = 1e-6) -> bool:
    if len(A) == 0 and len(B) == 0:
        return True
    if len(A) == 0 and len(B) != 0:
        return False
    if len(A) != 0 and len(B) == 0:
        return False
    if len(A) != len(B) or len(A[0]) != len(B[0]):
        return False

    for row_index in range(len(A)):
        for column_index in range(len(A[0])):
            if abs(A[row_index][column_index] - B[row_index][column_index]) > eps:
                return False

    return True


def sum_matrix_native(A: List[List[float]], axis: int) -> List[float]:
    if A is None or A == []:
        return []

    if axis == 0:
        result = []
        for column_index in range(len(A[0])):
            s = 0
            for row_index in range(len(A)):
                s += A[row_index][column_index]
            result.append(s)

        return result

    elif axis == 1:
        result = []
        for row_index in range(len(A)):
            s = 0
            for column_index in range(len(A[0])):
                s += A[row_index][column_index]
            result.append(s)

        return result

    return None


def mul_mat_native(A: List[List[float]], B: List[List[float]]) -> List[List[float]]:
    rows_A = len(A)
    columns_A = len(A[0]) if rows_A and A[0] else 0

    rows_B = len(B)
    columns_B = len(B[0]) if rows_B and B[0] else 0

    if columns_A != rows_B:
        raise ValueError("Matrix dimensions are incompatible")

    multiplied_matrix = [[] for _ in range(rows_A)]
    for row_index in range(rows_A):
        multiplied_matrix[row_index] = [0] * columns_B
        for column_index in range(columns_B):
            s = 0
            for sum_index in range(rows_B):
                s += A[row_index][sum_index] * B[sum_index][column_index]
            multiplied_matrix[row_index][column_index] = s

    return multiplied_matrix


def is_inverse_native(A: List[List[float]], B: List[List[float]], eps: float = 1e-6, ) -> bool:
    if len(A) == 0:
        return len(B) == 0

    if len(B) == 0:
        return False

    if len(A) != len(A[0]) or len(B) != len(B[0]) or len(A) != len(B):
        return False

    multiplied_matrix = mul_mat_native(A, B)
    identity_matrix = create_identity_matrix(len(multiplied_matrix))
    return list_equal(multiplied_matrix, identity_matrix, eps)


def create_identity_matrix(dimension: int) -> List[List[float]]:
    matrix = []
    for row_index in range(dimension):
        row = [0.0] * dimension
        row[row_index] = 1.0
        matrix.append(row)

    return matrix
