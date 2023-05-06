class_name InteractionReceiver
extends Area2D


# ----------------- DECLARE VARIABLES -----------------

export var can_receive_interaction_from_area_2d: bool = true

signal interaction_received

# ----------------- RUN CODE -----------------



# ----------------- DECLARE FUNCTIONS -----------------


func _receive_interaction() -> void:
	self.emit_signal("interaction_received")


#func _on_InteractionReceiverArea2D_body_entered(_body: PhysicsBody2D) -> void:
#	self._receive_interaction()


func _on_InteractionReceiverArea2D_area_entered(_area: Area2D) -> void:
	self._receive_interaction()
