#class_name 
extends AudioStreamPlayer


# ----------------- DECLARE VARIABLES -----------------

export var first_track_to_play_on_start: bool = false

# ----------------- RUN CODE -----------------

func _ready() -> void:
	self.initialize_asserts()

#	if not first_track_to_play_on_start:
#		self.set_muted(true)
	
#	self.stream.set_loop(true)
#	self.play()
	
	return

# ----------------- DECLARE FUNCTIONS -----------------


func initialize_asserts() -> void:
	if self.get_stream_playback() == null:
		printerr("(!) ERROR: In " + self.name + ": The Stream is not set!")
	return


#func set_muted(muted: bool) -> void:
#	if muted:
#		self.set_volume_db(-80)
#	else:
#		self.set_volume_db(0)
#
#
#	return
