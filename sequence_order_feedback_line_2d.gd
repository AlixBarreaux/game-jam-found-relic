class_name SequenceOrderFeedbackLine2D
extends Line2D


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
