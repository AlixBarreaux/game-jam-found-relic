class_name SequenceOrderInteractable
extends Node2D


# ----------------- DECLARE VARIABLES -----------------


var order_id: int = 0


# Node References
onready var plates_manager: Node2D = self.get_parent()
onready var collision_shape_2d: CollisionShape2D = $InteractionReceiverArea2D/CollisionShape2D


# Signals
signal interactable_enabled


# ----------------- RUN CODE -----------------


func _ready() -> void:
	self.initialize_signals()
	return


# ----------------- DECLARE FUNCTIONS -----------------


func initialize_signals() -> void:
	$InteractionReceiverArea2D.connect("interaction_received", self, "_receive_interaction")
	self.plates_manager.connect("invalid_sequence_order_given", self, "reset")
	return


func _receive_interaction() -> void:
	self.set_enabled(false)
	self.emit_signal("interactable_enabled", self.order_id)
	return


func reset() -> void:
	print(self.name + ": reset() !")
	set_enabled(true)


func set_enabled(enabled: bool) -> void:
	if enabled:
		collision_shape_2d.set_deferred("disabled", false)
	else:
		collision_shape_2d.set_deferred("disabled", true)
		
	return
