class_name SpaceBarTutorialArea2D
extends Area2D


# ----------------- DECLARE VARIABLES -----------------



# ----------------- RUN CODE -----------------



# ----------------- DECLARE FUNCTIONS -----------------


func _on_area_entered(_area: Area2D) -> void:
	self.queue_free()
