class_name SequenceOrderInteractable
extends Node2D


# ----------------- DECLARE VARIABLES -----------------


var order_id: int = 0

# Node Paths
export var collision_shape_2d_node_path: NodePath = ""

# Node References
onready var plates_manager: Node2D = self.get_parent()
onready var collision_shape_2d: CollisionShape2D = self.get_node(collision_shape_2d_node_path)


# Signals
signal plate_enabled


# ----------------- RUN CODE -----------------


func _ready() -> void:
	self.initialize_asserts()
	self.initialize_signals()
	return


# ----------------- DECLARE FUNCTIONS -----------------


func initialize_asserts() -> void:
	if collision_shape_2d_node_path == "":
		printerr("The path to the collision shape 2D is missing!")
	return


func initialize_signals() -> void:
	$InteractionReceiverArea2D.connect("interaction_received", self, "_receive_interaction")
	self.plates_manager.connect("invalid_sequence_order_given", self, "reset")
	return


func _receive_interaction() -> void:
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


func _on_Area2D_body_entered(body: Node) -> void:
	print("Raycast _on_Area2D_body_entered")


func _on_Area2D_body_shape_entered(body_rid: RID, body: Node, body_shape_index: int, local_shape_index: int) -> void:
	print("Raycast _on_Area2D_body_shape_entered")


func _on_Area2D_area_entered(area: Area2D) -> void:
	print("Raycast _on_Area2D_area_entered")
