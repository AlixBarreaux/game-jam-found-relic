class_name WinTrack
extends PlateTrack


# ----------------- DECLARE VARIABLES -----------------



# ----------------- RUN CODE -----------------


func _ready() -> void:
#	Events.connect("level_completed", self, "play")
	return


# ----------------- DECLARE FUNCTIONS -----------------


func _on_finished() -> void:
	print("FINISHED")
#	Events.emit_signal("next_scene_load_requested")
	return
