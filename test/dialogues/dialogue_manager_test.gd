extends DialogueManager
class_name DialogueManagerTest


# ----------------- DECLARE VARIABLES -----------------

# ---------------------- RUN CODE ---------------------

# ----------------- DECLARE FUNCTIONS -----------------


func _initialize_signals() -> void:
	print(self.name, ": Method _initialize_signals() overriden!")
	parent_node.connect("interactable_enabled", self, "_send_dialogue_with_arguments")
