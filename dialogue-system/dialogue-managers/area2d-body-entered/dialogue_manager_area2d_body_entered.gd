extends DialogueManager
class_name DialogueManagerArea2DBodyEntered


# ----------------- DECLARE VARIABLES -----------------

# ---------------------- RUN CODE ---------------------

# ----------------- DECLARE FUNCTIONS -----------------


func _initialize_signals() -> void:
	parent_node.connect("body_entered", self, "send_trigger")
