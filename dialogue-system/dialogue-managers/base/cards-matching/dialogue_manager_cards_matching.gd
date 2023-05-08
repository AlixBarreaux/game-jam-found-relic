extends DialogueManager
class_name DialogueManagerCardsMatching


# ----------------- DECLARE VARIABLES -----------------

# ---------------------- RUN CODE ---------------------

# ----------------- DECLARE FUNCTIONS -----------------


func _initialize_signals() -> void:
	node_to_connect_to.connect("life_cycle_finished", self, "send_trigger", [0])
