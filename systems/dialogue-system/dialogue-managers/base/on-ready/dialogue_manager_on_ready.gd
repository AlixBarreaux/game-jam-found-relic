extends DialogueManager
class_name DialogueManagerOnReady


# ----------------- DECLARE VARIABLES -----------------


# ---------------------- RUN CODE ---------------------


func _custom_on_ready() -> void:
	self.send_trigger(0)


# ----------------- DECLARE FUNCTIONS -----------------

