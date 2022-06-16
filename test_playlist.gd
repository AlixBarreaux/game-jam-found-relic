# class_name test playlist
extends Node


# ----------------- DECLARE VARIABLES -----------------


var current_playing_track_index: int = 0

# Node References
onready var ambient_track: AudioStreamPlayer = $Ambient/AmbientTrack
onready var general_tracks_list: Node = $GeneralTracks
onready var wrong_track: AudioStreamPlayer = $WrongTrack


# ----------------- RUN CODE -----------------


func _ready() -> void:
	self.initialize_asserts()
	self.initialize_signals()
	return


# ----------------- DECLARE FUNCTIONS -----------------


func initialize_asserts() -> void:
	var _first_track_count: int = 0
	var _max_first_track_count: int = 1
	
	for track in general_tracks_list.get_children():
		if track.first_track_to_play_on_start:
			_first_track_count +=1
	if _first_track_count != _max_first_track_count:
		printerr("(!) ERROR: In " + self.name + ": Only ONE track must be the starting track!")
	return


func initialize_signals() -> void:
	Events.connect("good_interaction_sent", self, "on_good_interaction_sent")
	Events.connect("wrong_interaction_sent", self, "on_wrong_interaction_sent")
	return


func on_good_interaction_sent() -> void:
	# Mute current track
#	general_tracks_list.get_child(current_playing_track_index).set_muted(true)
	general_tracks_list.get_child(current_playing_track_index).stop()
	
	current_playing_track_index += 1
	# Unmute next track
#	general_tracks_list.get_child(current_playing_track_index).set_muted(false)

	general_tracks_list.get_child(current_playing_track_index).play()
	if current_playing_track_index == general_tracks_list.get_child_count() -1:
		ambient_track.stop()
	return


func on_wrong_interaction_sent() -> void:
	# Mute last played track
#	general_tracks_list.get_child(current_playing_track_index).set_muted(true)
	general_tracks_list.get_child(current_playing_track_index).stop()
	
	current_playing_track_index = 0
	
#	general_tracks_list.get_child(current_playing_track_index).set_muted(false)

	wrong_track.play()
	
	return


#func _on_WrongTrack_finished() -> void:
	# Reset all tracks
#	for track in general_tracks_list.get_children():
#		track.seek(0.0)
	
	
#	general_tracks_list.get_child(current_playing_track_index).set_muted(false)
	return
