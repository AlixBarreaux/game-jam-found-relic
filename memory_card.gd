class_name MemoryCard
extends Node2D


# ----------------- DECLARE VARIABLES -----------------


var id: int = 0


# Node References
onready var parent_manager: Node2D = self.get_parent()
onready var interaction_receiver_area_2d: Area2D = $InteractionReceiverArea2D
onready var collision_shape_2d: CollisionShape2D = $InteractionReceiverArea2D/CollisionShape2D


# Signals
signal interactable_enabled


# ----------------- RUN CODE -----------------


func _ready() -> void:
	self.initialize_signals()
	return


# ----------------- DECLARE FUNCTIONS -----------------


func initialize_signals() -> void:
	interaction_receiver_area_2d.connect("interaction_received", self, "_receive_interaction")
#	self.parent_manager.connect("invalid_sequence_order_given", self, "reset")
	return


func _receive_interaction() -> void:
	self.set_enabled(false)
	self.emit_signal("interactable_enabled", self)
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
