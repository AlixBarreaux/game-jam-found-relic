extends DialogueManager
class_name DialogueManagerInteractableEnabled


# Assign node_to_connect_to to a MemoryCard node.
# (And not to a Group node)

# ----------------- DECLARE VARIABLES -----------------

# ---------------------- RUN CODE ---------------------

# ----------------- DECLARE FUNCTIONS -----------------


func _initialize_signals() -> void:
	node_to_connect_to.connect("life_cycle_finished", self, "send_trigger", [0])
