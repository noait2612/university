#################################################################
# FILE : wordsearch.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex5 2025
# DESCRIPTION: Find words inside letters matrix.
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools, docs.python.org
# NOTES: ...
#################################################################
import sys

# map each direction to it is actual action on a matrix.
directions_map = {
    "u": (-1, 0),
    "d": (1, 0),
    "l": (0, -1),
    "r": (0, 1),
    "w": (-1, 1),
    "x": (-1, -1),
    "y": (1, 1),
    "z": (1, -1),
}


def read_wordlist(filename: str) -> list[str]:
    with open(filename, "r") as f:
        return [x[:-2 if '\r' in x else -1] for x in f.readlines()]


def read_matrix(filename: str) -> list[list[str]]:
    with open(filename, "r") as f:
        return [x[:-1].split(',') for x in f.readlines()]


def write_output(results:list[tuple[str,int]], filename:str) -> None:
    with open(filename, "w") as f:
        for word, count in results:
            f.write(f"{word},{count}\n")

# Split the word into array of characters and indication of finished word.
def extract_words_mapping(word_list: list[str]) -> dict:
    characters_mapping = {}
    for word in word_list:
        inner_map = characters_mapping
        for character in word:
            if not character in inner_map:
                inner_map[character] = {}

            inner_map = inner_map[character]
        inner_map['EOW'] = None #EOW is a mark for end of word.
    return characters_mapping

""""scan for new word by going in the way of the direction and concat the word if we found more characters, until we reach EOW. 
Since two words can have a same start (like age and agile) we returns list of found words.
If we got to EOW and found our word we add it to result, if not we finished."""
def scan_for_new_word(words_mapping, matrix, row_index, column_index, direction) -> list[str]:
    found_words = []
    column = matrix[row_index][column_index]
    inner_map = words_mapping[column]
    new_word = column
    current_position = [row_index, column_index]
    while inner_map != {}:
        current_position[0] += directions_map[direction][0]
        current_position[1] += directions_map[direction][1]
        if not (0 <= current_position[0] < len(matrix) and 0 <= current_position[1] < len(matrix[row_index])):
            break

        current_character = matrix[current_position[0]][current_position[1]]
        if not current_character in inner_map:
            break

        inner_map = inner_map[current_character]
        new_word += current_character
        if "EOW" in inner_map:
            found_words.append(new_word)

    return found_words


def find_words(word_list: list[str], matrix: list[list[str]], directions: str) -> list[tuple[str, int]]:
    global directions_map
    found_words = dict([(word, 0) for word in word_list])
    words_mapping = extract_words_mapping(word_list)
    for direction in set(directions):
        for row_index, row in enumerate(matrix):
            for column_index, column in enumerate(row):
                if column in words_mapping:
                    new_words = scan_for_new_word(words_mapping, matrix, row_index, column_index, direction)
                    for new_word in new_words:
                        found_words[new_word] += 1

    return [tuple(found_word) for found_word in found_words.items() if found_word[1] > 0]


if __name__ == "__main__":
    args = sys.argv
    if len(args) != 5:
        print("Usage: wordsearch.py <wordlist_file> <matrix_file> <output_file> <directions>. Missing argument.")
        sys.exit(1)

    # We do this on main because we need the parameters results.
    words_file_name = args[1]
    matrix_file_name = args[2]
    output_file_name = args[3]
    directions = args[4]
    if set(directions) - set(directions_map.keys()):
        print(f"Unknown directions: {set(directions) - set(directions_map.keys())}")
        sys.exit(1)
    try:
        word_list = read_wordlist(words_file_name)
    except FileNotFoundError:
        print(f"word list file not exists in route {words_file_name}")
        sys.exit(1)
    try:
        matrix = read_matrix(matrix_file_name)
    except FileNotFoundError:
        print(f"matrix file not exists in route {matrix_file_name}")
        sys.exit(1)

    found_words = find_words(word_list, matrix, directions)
    try:
        write_output(found_words, output_file_name)
    except FileNotFoundError:
        print(f"output file can't be written in route {output_file_name}")
        sys.exit(1)

