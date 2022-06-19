#class_name MenusMusic
extends AudioStreamPlayer


# ----------------- DECLARE VARIABLES -----------------

var has_been_played_at_least_once: bool = false

# ----------------- RUN CODE -----------------


func _ready() -> void:
	self.stream.set_loop(true)
	return


# ----------------- DECLARE FUNCTIONS -----------------

