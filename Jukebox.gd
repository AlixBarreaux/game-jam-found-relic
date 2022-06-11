class_name JukeBox
extends Node2D


# ----------------- DECLARE VARIABLES -----------------

onready var before_replay_sound_timer: Timer = $BeforeSoundReplayTimer
onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

# ----------------- RUN CODE -----------------

func _ready() -> void:
	before_replay_sound_timer.start()
	return

# ----------------- DECLARE FUNCTIONS -----------------


func _on_NoteBlocks_invalid_sequence_order_given() -> void:
	before_replay_sound_timer.start()
	return


func _on_BeforeSoundReplayTimer_timeout() -> void:
	audio_stream_player.play()
	return
