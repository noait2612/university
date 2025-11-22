#################################################################
# FILE : wordsearch_test.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex5 2025
# DESCRIPTION: Find words inside letters matrix.
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools, docs.python.org
# NOTES: ...
#################################################################
import pytest
from wordsearch import *

ROOT_FOLDER = "TestResources"


def test_read_wordlist() -> None:
    file_result = read_wordlist(f"{ROOT_FOLDER}/word_list.txt")
    assert file_result == ["dog",
                           "CAT",
                           "cAt",
                           "anTs",
                           "apple",
                           "cake",
                           "long",
                           "short",
                           "can",
                           "toe",
                           "poeT",
                           "Crop",
                           "one",
                           "two",
                           "three",
                           "four",
                           "five",
                           "six",
                           "seven",
                           "eight",
                           "nine",
                           "ten",
                           "PoP",
                           "pole",
                           "raw",
                           "red",
                           "blue",
                           "move",
                           "gum",
                           "son",
                           "shoe",
                           "she",
                           "he",
                           "bye"]


def test_read_matrix() -> None:
    file_result = read_matrix(f"{ROOT_FOLDER}/mat.txt")
    assert file_result == [['a', 'p', 'p', 'l', 'e'],
                           ['a', 'g', 'o', 'd', 'o'],
                           ['n', 'n', 'e', 'r', 't'],
                           ['g', 'a', 'T', 'A', 'C'],
                           ['m', 'i', 'c', 's', 'r'],
                           ['P', 'o', 'P', 'o', 'P']]


def test_find_words_longer_than_matrix() -> None:
    matrix = read_matrix(f"{ROOT_FOLDER}/mat.txt")
    all_possible_directions = get_power_set_of_directions()
    for direction in all_possible_directions:
        found_words = find_words(["subapproximation"], matrix, direction)
        assert found_words == []

def test_find_words_repeated_multiple_times() -> None:
    matrix = read_matrix(f"{ROOT_FOLDER}/mat.txt")
    found_words = find_words(["PoP"], matrix, "lr")
    assert len(found_words) == 1
    assert found_words[0] == ("PoP", 4)

def test_find_words_no_matches() -> None:
    matrix = read_matrix(f"{ROOT_FOLDER}/mat.txt")
    all_possible_directions = get_power_set_of_directions()
    for direction in all_possible_directions:
        found_words = find_words(["Magic"], matrix, direction)
        assert found_words == []

def test_extract_words_mapping() -> None:
    mapping = extract_words_mapping(["Magic"])
    assert mapping == {'M': {'a': {'g': {'i': {'c': {'EOW': None}}}}}}

def test_extract_words_mapping_overlap() -> None:
    mapping = extract_words_mapping(["Age", "Agile"])
    assert mapping == {'A': {'g': {'e': {'EOW': None}, 'i': {'l': {'e': {'EOW': None}}}}}}


def get_power_set_of_directions():
    directions_keys = list(directions_map.keys())
    return [
        [
            directions_keys[i]
            for i in range(len(directions_keys))
            if (x // 2 ** i) % 2 == 1
        ]
        for x in range(2 ** len(directions_keys))
    ]
