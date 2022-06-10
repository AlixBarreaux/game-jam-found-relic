class_name Plate
extends Area2D


# ----------------- DECLARE VARIABLES -----------------

onready var plates_manager: Node2D = self.get_parent()

var order_id: int = 0

onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

signal plate_enabled

# ----------------- RUN CODE -----------------


func _ready() -> void:
	self.initialize_signals()
	return


# ----------------- DECLARE FUNCTIONS -----------------


func initialize_signals() -> void:
	self.plates_manager.connect("invalid_sequence_order_given", self, "reset")
	return


func _on_body_entered(body: PhysicsBody2D) -> void:
	self.set_enabled(false)
	self.emit_signal("plate_enabled", self.order_id)
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



