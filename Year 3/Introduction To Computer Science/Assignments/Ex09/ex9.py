from itertools import *


class Node:
    def __init__(self, data, positive_child=None, negative_child=None):
        self.data = data
        self.positive_child = positive_child
        self.negative_child = negative_child

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
        pos = self.root

        # Since we can have both Nones or both not Nones, it is enough to check on one of them.
        while pos.positive_child is not None:
            pos = pos.positive_child if pos.data in symptoms else pos.negative_child

        return pos.data

    def calculate_success_rate(self, records):
        if len(records) == 0:
            raise ValueError("Not supported length of records")

        count = 0
        for record in records:
            calculated_diagnosis = self.diagnose(record.symptoms)
            if calculated_diagnosis == record.illness:
                count += 1

        return count / len(records)

    def all_illnesses(self):
        extracted_illnesses = self.__inner_all_illnesses(self.root)
        return [x[0] for x in sorted(groupby(extracted_illnesses), key=lambda kv: len(list(kv[1])), reverse=True)]

    def __inner_all_illnesses(self, node):
        if node is None:
            return []

        if node.negative_child is None and node.positive_child is None:
            return [node.data]

        return self.__inner_all_illnesses(node.negative_child) + self.__inner_all_illnesses(node.positive_child)

    def paths_to_illness(self, illness) -> list:
        return self.__inner_paths_to_illness(illness, [], self.root)

    def __inner_paths_to_illness(self, illness, path, node):
        if node.negative_child is None:
            if node.data == illness or illness is None:
                return [path]
            else:
                return None

        a = self.__inner_paths_to_illness(illness, path + [False], node.negative_child)
        b = self.__inner_paths_to_illness(illness, path + [True], node.positive_child)
        ans = []
        if a:
            ans += a

        if b:
            ans += b

        return ans

    def minimize(self, remove_empty=False):
       self.__inner_minimize(self.root, remove_empty)

    def __inner_minimize(self, node: Node, remove_empty=False):
        if node is None:
            return

        self.__inner_minimize(node.positive_child, remove_empty)
        self.__inner_minimize(node.negative_child, remove_empty)
        if self.__redundant_node(node):
            node.data = node.positive_child.data
            node.negative_child = None
            node.positive_child = None

        if not remove_empty and node.positive_child is not None:
            return

        a = self.__inner_all_illnesses(node.positive_child)
        if len(a) == 1 and a[0] == 'healthy':
            node.data = node.negative_child.data
            node.positive_child = node.negative_child.positive_child
            node.negative_child = node.negative_child.negative_child

        a = self.__inner_all_illnesses(node.negative_child)
        if len(a) == 1 and a[0] == 'healthy':
            node.data = node.positive_child.data
            node.negative_child = node.positive_child.negative_child
            node.positive_child = node.positive_child.positive_child

    def __redundant_node(self, node):
        if node.positive_child is None or node.negative_child is None:
            return False

        return set(self.__inner_all_illnesses(node.negative_child)) == set(self.__inner_all_illnesses(node.positive_child))


def build_tree(records, symptoms):
    # TODO: What about exceptions Noa!?!?!?!
    records = [record for record in records if set(record.symptoms).issubset(set(symptoms))]
    node = __inner_build_tree(records, symptoms)
    return Diagnoser(node)


def __inner_build_tree(records, symptoms):
    if not symptoms:
        return Node(records[0].illness if len(records) > 0 else "healthy")

    node = Node(symptoms[0])
    node.negative_child = __inner_build_tree([record for record in records if symptoms[0] not in record.symptoms],
                                             symptoms[1:])
    node.positive_child = __inner_build_tree([record for record in records if symptoms[0] in record.symptoms],
                                             symptoms[1:])
    return node


def optimal_tree(records, symptoms, depth):
    # TODO: Noa!!!!!!!!!
    options = combinations(symptoms, depth)
    current = None
    current_score = -1
    for option in options:
        diagnoser = build_tree(records, option)
        score = diagnoser.calculate_success_rate(records)
        if score > current_score:
            current_score = score
            current = diagnoser

    return current


if __name__ == "__main__":

    # Manually build a simple tree.
    #                cough
    #          Yes /       \ No
    #        fever           healthy
    #   Yes /     \ No
    # covid-19   cold

    flu_leaf = Node("covid-19", None, None)
    cold_leaf = Node("cold", None, None)
    inner_vertex = Node("fever", flu_leaf, cold_leaf)
    healthy_leaf = Node("healthy", None, None)
    root = Node("cough", inner_vertex, healthy_leaf)

    diagnoser = Diagnoser(root)

    # Simple test
    diagnosis = diagnoser.diagnose(["cough"])
    if diagnosis == "cold":
        print("Test passed")
    else:
        print("Test failed. Should have printed cold, printed: ", diagnosis)

    # Add more tests for sections 2-7 here.
    records = [
        Record("cold", ["cough"]),
        Record("covid-19", ["cough", "fever"]),
        Record("hepatitis", ["yellowness"]),
        Record("lupus", ["fever", "fur"])
    ]
    ratio = diagnoser.calculate_success_rate(records)
    if ratio == 0.5:
        print("Test passed")
    else:
        print("Test failed. Should have printed 0.5, printed: ", ratio)

    all_illnesses = diagnoser.all_illnesses()
    if all_illnesses == ['healthy', 'cold', 'covid-19']:
        print("Test passed")
    else:
        print("Test failed. Should have printed the thing, printed: ", all_illnesses)

    paths = diagnoser.paths_to_illness('cold')
    if paths == [[True, False]]:
        print("Test passed")
    else:
        print("Test failed. Should have printed the thing, printed: ", paths)

    #symptoms = list(set(chain.from_iterable(x.symptoms for x in records)))
    symptoms = ['fever', 'headache', 'cough', 'fur', 'yellowness']
    symptoms = ['headache', 'fever', 'cough']
    diagnoser = build_tree(records, symptoms)
    print(diagnoser.root)
    diagnoser.minimize(True)
    print(diagnoser.root)
