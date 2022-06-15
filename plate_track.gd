#class_name 
extends AudioStreamPlayer


# ----------------- DECLARE VARIABLES -----------------

export var first_track_to_play_on_start: bool = false

# ----------------- RUN CODE -----------------

func _ready() -> void:

	if not first_track_to_play_on_start:
		self.set_muted(true)
	return

# ----------------- DECLARE FUNCTIONS -----------------


func set_muted(muted: bool) -> void:
	if muted:
		self.set_volume_db(-80)
	else:
		self.set_volume_db(0)
		
		
	return
