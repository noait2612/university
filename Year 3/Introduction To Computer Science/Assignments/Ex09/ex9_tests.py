import pytest
from ex9 import *

def test_success_rate_exception():
    diagnostic = Diagnoser(Node("Healthy"))
    with pytest.raises(ValueError):
        diagnostic.calculate_success_rate([])


def test_all_illnesses_sorted():
    root_node = Node("fever", Node("cough", Node("Cold"), Node("Flue")),
                     Node("headache", Node("Cold"), Node(None)))
    diagnoser = Diagnoser(root_node)
    assert diagnoser.all_illnesses() == ['Cold', 'Flue']


#From the example in ex page
def test_diagnose():
    positive_node = Node("Take coat")
    negative_node = Node("Don't take coat")
    cold_node = Node("Cold", positive_node, negative_node)
    root = Node("raining", positive_node, cold_node)

    diagnoser = Diagnoser(root)
    assert diagnoser.diagnose(["raining"]) == "Take coat"
    assert diagnoser.diagnose(["Cold"]) == "Take coat"
    assert diagnoser.diagnose([]) == "Don't take coat"

    #This is case for mistake.
    assert diagnoser.diagnose(["cold"]) == "Don't take coat"


def test_paths_to_illness_example():
    # Example from PDF Page 7
    covid = Node("Covid-19")
    cold = Node("Cold")
    healthy = Node("Healthy")
    cough_node = Node("Cough", cold, healthy)
    root = Node("Headache", covid, cough_node)
    diagnoser = Diagnoser(root)

    paths_cold = diagnoser.paths_to_illness("Cold")
    paths_healthy = diagnoser.paths_to_illness("Healthy")
    # Should be [[True, False], [False, True]] or the other way around
    assert [False, True] in paths_cold
    assert [False, False] in paths_healthy


def test_build_tree_majority_vote():
    records = [
        Record("Influenza", ["cough", "fever"]),
        Record("Influenza", ["fever"]),
        Record("Cold", ["cough"])
    ]
    # If we only ask about "fever":
    # Yes path: 2 records (both Influenza) -> Influenza
    # No path: 1 record (Cold) -> Cold
    tree = build_tree(records, ["fever"])
    assert tree.root.data == "fever"
    assert tree.root.positive_child.data == "Influenza"
    assert tree.root.negative_child.data == "Cold"


def test_build_tree_none_leaf():
    records = [Record("Cold", ["cough"])]
    # Ask about "fever". No records have fever.
    # The positive child (Yes to fever) should be None.
    diagnoser = build_tree(records, ["fever"])
    assert diagnoser.root.positive_child.data is None


def test_optimal_tree_exceptions():
    with pytest.raises(ValueError):
        optimal_tree([], ["fever"], 5)  # depth > len(symptoms)
    with pytest.raises(ValueError):
        optimal_tree([], ["fever", "fever"], 1)  # duplicate symptoms


def test_minimize_redundant():
    # Question "fever" where both paths lead to "Cold"
    root = Node("fever", Node("Cold"), Node("Cold"))
    diagnoser = Diagnoser(root)
    diagnoser.minimize(remove_empty=False)
    assert diagnoser.root.data == "Cold"


def test_minimize_remove_empty():
    # Question "fever": Yes -> "Cold", No -> Node(None)
    root = Node("fever", Node("Cold"), Node(None))
    diagnoser = Diagnoser(root)
    # With remove_empty=True, the "None" branch makes the question redundant
    diagnoser.minimize(remove_empty=True)
    assert diagnoser.root.data == "Cold"


def test_minimize_with_none_logic():
    """
    Tests the logic from Page 11 regarding remove_empty=True.
    A question node is redundant if one of its children's paths
    all lead to None .
    """
    # Root: "fever". Yes -> "Flu", No -> Node(None)
    root = Node("fever", Node("Flu"), Node(None))
    diagnoser = Diagnoser(root)

    # we replace the question with the child that isn't None.
    diagnoser.minimize(remove_empty=True)
    assert diagnoser.root.data == "Flu"
    assert diagnoser.root.positive_child is None