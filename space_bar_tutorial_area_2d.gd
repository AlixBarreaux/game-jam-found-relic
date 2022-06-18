class_name SpaceBarTutorialArea2D
extends Area2D


# ----------------- DECLARE VARIABLES -----------------



# ----------------- RUN CODE -----------------



# ----------------- DECLARE FUNCTIONS -----------------


func _on_body_entered(_body: PhysicsBody2D) -> void:
	self.queue_free()
	return
