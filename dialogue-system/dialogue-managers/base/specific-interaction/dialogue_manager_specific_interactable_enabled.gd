extends DialogueManager
class_name DialogueManagerSpecificInteractableEnabled


# Assign node_to_connect_to to a MemoryCard node.
# (And not to a Group node)

# ----------------- DECLARE VARIABLES -----------------

# ---------------------- RUN CODE ---------------------

# ----------------- DECLARE FUNCTIONS -----------------


func _initialize_signals() -> void:
	node_to_connect_to.connect("interactable_enabled", self, "send_trigger")
