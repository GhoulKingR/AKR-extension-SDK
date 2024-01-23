from abc import ABC, abstractmethod
from tqdm import tqdm

class AnimeExtension(ABC):
    def __init__(self, debug: True):
        self._debug = debug
    
    def get_anime_choice(self):
        while True:
            u_input = input("Your choice (0 to search again): ")
            self._choice = int(u_input)
            if self._choice != None and self._choice > 0:
                break
    
    @abstractmethod
    def run(self, search):
        pass