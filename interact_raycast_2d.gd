class_name InteractRaycast2D
extends RayCast2D


# ----------------- DECLARE VARIABLES -----------------



# ----------------- RUN CODE -----------------



# ----------------- DECLARE FUNCTIONS -----------------


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		print(get_collider().name)
		get_collider()._receive_interaction()
