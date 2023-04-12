extends DialogueManager
class_name DialogueManagerLevelStart


# ----------------- DECLARE VARIABLES -----------------


# ---------------------- RUN CODE ---------------------


func _custom_on_ready() -> void:
	self._send_dialogue(0)


# ----------------- DECLARE FUNCTIONS -----------------

