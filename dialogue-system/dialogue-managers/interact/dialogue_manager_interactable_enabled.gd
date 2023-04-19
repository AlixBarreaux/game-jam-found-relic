extends DialogueManager
class_name DialogueManagerInteractableEnabled


# ----------------- DECLARE VARIABLES -----------------

# ---------------------- RUN CODE ---------------------

# ----------------- DECLARE FUNCTIONS -----------------


func _initialize_signals() -> void:
	parent_node.connect("interactable_enabled", self, "_send_dialogue")
