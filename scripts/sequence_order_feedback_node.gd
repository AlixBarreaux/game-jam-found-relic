class_name SequenceOrderFeedbackNode
extends Node2D


# ----------------- DECLARE VARIABLES -----------------

onready var animation_player: AnimationPlayer = $AnimationPlayer

# ----------------- RUN CODE -----------------



# ----------------- DECLARE FUNCTIONS -----------------


func enable() -> void:
	animation_player.play("Enable")
	return


func disable() -> void:
	animation_player.play("Disable")
	return


func on_win() -> void:
	animation_player.play("Win")
	return


func get_self_modulate():
	pass
