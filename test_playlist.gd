# class_name test playlist
extends Node


# ----------------- DECLARE VARIABLES -----------------

var current_playing_track_index: int = 0

# ----------------- RUN CODE -----------------

func _ready() -> void:
	self.initialize_asserts()
	self.initialize_signals()
	
	yield(get_tree().create_timer(1.0), "timeout")
	play_next_track()
	return

# ----------------- DECLARE FUNCTIONS -----------------


func initialize_asserts() -> void:
	var _first_track_count: int = 0
	var _max_first_track_count: int = 1
	
	for track in self.get_children():
		if track.first_track_to_play_on_start:
			_first_track_count +=1
	if _first_track_count != _max_first_track_count:
		printerr("(!) ERROR: In " + self.name + ": Only ONE track must be the starting track!")
	return


func initialize_signals() -> void:
	Events.connect("next_track_in_playlist_requested", self, "play_next_track")
	return


func play_next_track() -> void:
	# Mute current track
	self.get_child(current_playing_track_index).set_muted(true)
	
	current_playing_track_index += 1
	# Unmute next track
	# HANDLE WHEN THERE IS NO NEXT TRACK TO PLAY !!!!!!!!!!!!!!!
	self.get_child(current_playing_track_index).set_muted(false)
	return
