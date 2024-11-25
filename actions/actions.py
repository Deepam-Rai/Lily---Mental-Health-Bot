from typing import Any, Text, Dict, List, Optional
from rasa_sdk import Action, Tracker, ValidationAction
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.types import DomainDict
import logging


logger = logging.getLogger(__name__)


class ActionGreet(Action):
    """
    Description: Greets the user.
    """
    def name(self) -> Text:
        return "action_greet"

    async def run(
        self,
        dispatcher: "CollectingDispatcher",
        tracker: Tracker,
        domain: "DomainDict",
    ) -> List[Dict[Text, Any]]:
        dispatcher.utter_message(response="utter_greet")
        return []
