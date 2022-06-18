class_name TutorialSpaceBarSprite
extends Sprite


# ----------------- DECLARE VARIABLES -----------------



# ----------------- RUN CODE -----------------


func _ready() -> void:
	self.hide()
	return


func _unhandled_key_input(event: InputEventKey) -> void:
	if Input.is_action_just_pressed("switch_characters"):
		self.queue_free()
	return


# ----------------- DECLARE FUNCTIONS -----------------


func _on_SpaceBarTutorialArea2D_body_entered(_body: PhysicsBody2D) -> void:
	self.show()
	return
