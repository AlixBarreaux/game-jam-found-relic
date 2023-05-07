extends DialogueManager
class_name DialogueManagerInteractableEnabled


# ----------------- DECLARE VARIABLES -----------------

# ---------------------- RUN CODE ---------------------

# ----------------- DECLARE FUNCTIONS -----------------


func _initialize_signals() -> void:
	node_to_connect_to.connect("interactable_enabled", self, "send_trigger")
