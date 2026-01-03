import numpy
import pytest
from Assignments.Ex10.game_of_life import *
from Assignments.Ex10.general_functions_vec import *


def test_game_of_life1():
    board = numpy.array([[0, 0, 0, 0, 0, 0],
                         [0, 0, 1, 1, 0, 0],
                         [0, 1, 1, 0, 0, 0],
                         [0, 0, 1, 1, 0, 0],
                         [0, 0, 0, 0, 0, 0],
                         [0, 0, 0, 0, 0, 0]])
    result = game_of_life(board, 0)
    assert ndarray_equal(board, result)
    result = game_of_life(board, 1)
    assert ndarray_equal(result, numpy.array([[0, 0, 0, 0, 0, 0],
                                              [0, 1, 1, 1, 0, 0],
                                              [0, 1, 0, 0, 0, 0],
                                              [0, 1, 1, 1, 0, 0],
                                              [0, 0, 0, 0, 0, 0],
                                              [0, 0, 0, 0, 0, 0]]), 0)
    result = game_of_life(board, 2)
    assert ndarray_equal(result, numpy.array([[0, 0, 1, 0, 0, 0],
                                              [0, 1, 1, 0, 0, 0],
                                              [1, 0, 0, 0, 0, 0], [0, 1, 1, 0, 0, 0],
                                              [0, 0, 1, 0, 0, 0],
                                              [0, 0, 0, 0, 0, 0]]), 0)
    result = game_of_life(board, 3)
    assert ndarray_equal(result, numpy.array([[0, 1, 1, 0, 0, 0],
                                              [0, 1, 1, 0, 0, 0],
                                              [1, 0, 0, 0, 0, 0],
                                              [0, 1, 1, 0, 0, 0],
                                              [0, 1, 1, 0, 0, 0],
                                              [0, 0, 0, 0, 0, 0]]), 0)


def test_game_of_life2():
    board = numpy.array([[0, 0, 0, 1, 0, 0],
                         [0, 0, 0, 1, 0, 0],
                         [0, 1, 1, 0, 1, 0],
                         [0, 0, 0, 1, 0, 0],
                         [0, 0, 0, 1, 0, 0],
                         [0, 0, 0, 0, 0, 0]])
    result = game_of_life(board, 500)
    assert ndarray_equal(result, numpy.array([[0, 0, 0, 0, 0, 0],
                                              [0, 0, 0, 1, 1, 0, ],
                                              [0, 0, 1, 0, 0, 1, ],
                                              [0, 0, 0, 1, 1, 0, ],
                                              [0, 0, 0, 0, 0, 0, ],
                                              [0, 0, 0, 0, 0, 0, ]]), 0)


def test_game_of_life_kernel1():
    kernel = numpy.array([
        [1, 0, 1],
        [0, 0, 0],
        [1, 0, 1]
    ])
    life_threshold = 2
    overcrowding_threshold = 4
    board = numpy.array([
        [0, 0, 0, 1, 0, 0],
        [0, 0, 0, 1, 0, 0],
        [0, 1, 1, 0, 1, 0],
        [0, 0, 0, 1, 0, 0],
        [0, 0, 0, 1, 0, 0]])
    gen_num = 3
    result = game_of_life_kernel(board, kernel, gen_num, life_threshold,
                                 overcrowding_threshold)
    assert ndarray_equal(result, numpy.array([[0, 0, 0, 0, 0, 0],
                                              [0, 0, 0, 1, 0, 0],
                                              [0, 0, 1, 0, 1, 0],
                                              [0, 0, 0, 1, 0, 0],
                                              [0, 0, 0, 0, 0, 0, ]]), eps=0)


def test_game_of_life_kernel2():
    kernel = numpy.array([
        [0, 1, 0],
        [1, 0, 1],
        [1, 1, 0]
    ])
    life_threshold = 1
    overcrowding_threshold = 5
    board = numpy.array([
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 1, 0, 0],
        [0, 0, 1, 1, 1, 0],
        [0, 0, 0, 1, 0, 0],
        [0, 0, 0, 0, 0, 0]])
    gen_num = 3
    result = game_of_life_kernel(board, kernel, gen_num, life_threshold, overcrowding_threshold)
    assert ndarray_equal(result, numpy.array([[0, 0, 0, 0, 0, 0, ],
                                              [0, 0, 1, 1, 1, 0, ],
                                              [0, 0, 1, 1, 1, 0, ],
                                              [0, 0, 1, 1, 1, 0, ],
                                              [0, 0, 0, 0, 0, 0, ]]))
