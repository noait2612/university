#################################################################
# FILE : ex9.py
# WRITER : your_name , your_login , your_id
# EXERCISE : intro2cs ex9 2025
# DESCRIPTION: A class that represents a tree logic.
# STUDENTS I DISCUSSED THE EXERCISE WITH: -
# WEB PAGES I USED: w3schools, docs.python.org
# NOTES: ...
#################################################################
from itertools import *

class Node:
    def __init__(self, data, positive_child=None, negative_child=None):
        self.data = data
        self.positive_child = positive_child
        self.negative_child = negative_child


    # Using json to more clear build of object in text
    def __str__(self):
        string = f"{{ \"data\": \"{self.data}\""
        if self.positive_child is not None:
            string += f", \"positive\": {str(self.positive_child)}"

        if self.negative_child is not None:
            string += f", \"negative\": {str(self.negative_child)}"

        return string + ' }'


class Record:
    def __init__(self, illness, symptoms):
        self.illness = illness
        self.symptoms = symptoms


    # Using json to more clear build of object in text
    def __str__(self):
        return f'(Illness: {self.illness}, symptoms: {self.symptoms})'


def parse_data(filepath):
    with open(filepath) as data_file:
        records = []
        for line in data_file:
            words = line.strip().split()
            records.append(Record(words[0], words[1:]))
        return records


class Diagnoser:
    def __init__(self, root: Node):
        self.root = root

    def __str__(self):
        return f'Diagnoser(root: {self.root})'

    def diagnose(self, symptoms):
        position = self.root

        # Since we can have both Nones or both not Nones, it is enough to check on one of them.
        while position.positive_child is not None:
            position = position.positive_child if position.data in symptoms else position.negative_child

        return position.data


    def calculate_success_rate(self, records):
        if len(records) == 0:
            raise ValueError("Not supported length of records")

        count_of_hits = 0
        for record in records:
            calculated_diagnosis = self.diagnose(record.symptoms)
            if calculated_diagnosis == record.illness:
                count_of_hits += 1

        return count_of_hits / len(records)


    def all_illnesses(self):
        mapped_illnesses = {}
        self.__map_illnesses(self.root, mapped_illnesses)
        sorted_illnesses = sorted(mapped_illnesses.keys(), key=lambda x: mapped_illnesses[x], reverse=True)
        return sorted_illnesses


    def __map_illnesses(self, node, mapped_illnesses):
        if node is None:
            return
        if node.positive_child is None and node.negative_child is None:
            if node.data is not None:
                mapped_illnesses[node.data] = mapped_illnesses.get(node.data, 0)
                return

        self.__map_illnesses(node.positive_child, mapped_illnesses)
        self.__map_illnesses(node.negative_child, mapped_illnesses)

    def paths_to_illness(self, illness) -> list:
        return self.__inner_paths_to_illness(illness, [], self.root)

    def __inner_paths_to_illness(self, illness, path, node):
        if node.negative_child is None:
            if node.data == illness or illness is None:
                return [path]
            else:
                return None

        inner_paths_from_negative_node = self.__inner_paths_to_illness(illness, path + [False], node.negative_child)
        inner_paths_from_positive_node = self.__inner_paths_to_illness(illness, path + [True], node.positive_child)
        result = []
        if inner_paths_from_negative_node:
            result += inner_paths_from_negative_node

        if inner_paths_from_positive_node:
            result += inner_paths_from_positive_node

        return result

    def minimize(self, remove_empty=False):
        self.root = self.__inner_minimize(self.root, remove_empty)

    def __inner_minimize(self, node: Node, remove_empty):
        if node.positive_child is None and node.negative_child is None:
            return node

        node.positive_child = self.__inner_minimize(node.positive_child, remove_empty)
        node.negative_child = self.__inner_minimize(node.negative_child, remove_empty)

        if self.__are_subtrees_equal(node.positive_child, node.negative_child):
            return node.positive_child

        if remove_empty:
            if self.__is_only_none(node.positive_child):
                return node.negative_child
            if self.__is_only_none(node.negative_child):
                return node.positive_child

        return node

    def __are_subtrees_equal(self, node1, node2):
        if node1 is node2:
            return True
        if node1 is None or node2 is None:
            return False
        if node1.data != node2.data:
            return False
        return (self.__are_subtrees_equal(node1.negative_child, node2.negative_child)
                and self.__are_subtrees_equal(node1.positive_child, node2.positive_child))

    def __is_only_none(self, node):
        if node is None:
            return True
        if node.positive_child is None and node.negative_child is None:
            return node.data is None
        return self.__is_only_none(node.positive_child) and self.__is_only_none(node.negative_child)


def build_tree(records, symptoms):
    if not all(isinstance(r, Record) for r in records):
        raise TypeError("Not supported records")
    if not all(isinstance(s, str) for s in symptoms):
        raise TypeError("Not supported symptoms")

    node = __inner_build_tree(records, symptoms)
    return Diagnoser(node)


def __inner_build_tree(current_records, reamining_symptoms):
    if not reamining_symptoms:
        if not current_records:
            return Node(None)

        mapped_symptoms = {}
        for r in current_records:
            mapped_symptoms[r.illness] = mapped_symptoms.get(r.illness, 0) + 1
        max_illness = max(mapped_symptoms, key=mapped_symptoms.get)
        return Node(max_illness)

    question = reamining_symptoms[0]
    positive_records = [record for record in current_records if question in record.symptoms]
    negative_records = [record for record in current_records if question not in record.symptoms]

    return Node(question, __inner_build_tree(positive_records, reamining_symptoms[1:]),
                __inner_build_tree(negative_records, reamining_symptoms[1:]))


def optimal_tree(records, symptoms, depth):
    if not (0 <= depth <= len(symptoms)):
        raise ValueError("Not supported depth")
    if len(set(symptoms)) != len(symptoms):
        raise ValueError("Symptoms contains duplicates")

    current_best_diagnoser = None
    current_best_score = -1

    for subset in combinations(symptoms, depth):
        current_diagnoser = build_tree(records, list(subset))
        score = current_diagnoser.calculate_success_rate(records)

        if score > current_best_score:
            current_best_score = score
            current_best_diagnoser = current_diagnoser

    return current_best_diagnoser


def manually_test():
    # Manually build a simple tree.
    #                cough
    #          Yes /       \ No
    #        fever           healthy
    #   Yes /     \ No
    # covid-19   cold

    # flu_leaf = Node("covid-19", None, None)
    # cold_leaf = Node("cold", None, None)
    # inner_vertex = Node("fever", flu_leaf, cold_leaf)
    # healthy_leaf = Node("healthy", None, None)
    # root = Node("cough", inner_vertex, healthy_leaf)
    #
    # diagnoser = Diagnoser(root)
    #
    # # Simple test
    # diagnosis = diagnoser.diagnose(["cough"])
    # if diagnosis == "cold":
    #     print("Test passed")
    # else:
    #     print("Test failed. Should have printed cold, printed: ", diagnosis)
    #
    # # Add more tests for sections 2-7 here.
    # records = [
    #     Record("cold", ["cough"]),
    #     Record("covid-19", ["cough", "fever"]),
    #     Record("hepatitis", ["yellowness"]),
    #     Record("lupus", ["fever", "fur"])
    # ]
    # ratio = diagnoser.calculate_success_rate(records)
    # if ratio == 0.5:
    #     print("Test passed")
    # else:
    #     print("Test failed. Should have printed 0.5, printed: ", ratio)
    #
    # all_illnesses = diagnoser.all_illnesses()
    # if all_illnesses == ['healthy', 'cold', 'covid-19']:
    #     print("Test passed")
    # else:
    #     print("Test failed. Should have printed the thing, printed: ", all_illnesses)
    #
    # paths = diagnoser.paths_to_illness('cold')
    # if paths == [[True, False]]:
    #     print("Test passed")
    # else:
    #     print("Test failed. Should have printed the thing, printed: ", paths)
    #
    # # symptoms = list(set(chain.from_iterable(x.symptoms for x in records)))
    # symptoms = ['fever', 'headache', 'cough', 'fur', 'yellowness']
    # symptoms = ['headache', 'fever', 'cough']
    # diagnoser = build_tree(records, symptoms)
    # print(diagnoser.root)
    # diagnoser.minimize(True)
    # print(diagnoser.root)

    pass


if __name__ == "__main__":
    manually_test()