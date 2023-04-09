extends DialogueManager
class_name DialogueManagerTimer


# ----------------- DECLARE VARIABLES -----------------

# ---------------------- RUN CODE ---------------------

# ----------------- DECLARE FUNCTIONS -----------------


func _initialize_signals() -> void:
	parent_node.connect("timeout", self, "_send_dialogue", [0])


#func send_dialogue_without_arguments() -> void:
#	# Disable timer timeout signal if timer spams it
#	parent_node.disconnect("timeout", self, "_send_dialogue")
#	self.dialogue_gui.receive_dialog(data)
