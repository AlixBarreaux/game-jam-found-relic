class_name SequenceOrderFeedbackSprite
extends Sprite


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
