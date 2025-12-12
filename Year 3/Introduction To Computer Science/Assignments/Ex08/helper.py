from typing import Dict, List, Union
import json

# JSON doesn't support tuples, so we use a list to represent coordinates
JsonCoordinates = List[int]
CarConfiguration = List[Union[int, JsonCoordinates]]


def load_json(filename: str) -> Dict[str, CarConfiguration]:
    """
    This function opens a JSON file and loads its content.
    :param filename: path to the json file.
    :return: A dictionary containing the content of the JSON file.
    """
    with open(filename, 'r') as json_file:
        car_config: Dict[str, CarConfiguration] = json.load(json_file)
    # now car_config is a dictionary equivalent to the JSON file
    return car_config
