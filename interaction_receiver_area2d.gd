class_name InteractionReceiver
extends Area2D


# ----------------- DECLARE VARIABLES -----------------

signal interaction_received

# ----------------- RUN CODE -----------------



# ----------------- DECLARE FUNCTIONS -----------------

func _receive_interaction() -> void:
	self.emit_signal("interaction_received")
	return
