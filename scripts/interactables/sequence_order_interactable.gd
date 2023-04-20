class_name SequenceOrderInteractable
extends Node2D


# ----------------- DECLARE VARIABLES -----------------


var id: int = 0


# Node References
onready var parent_manager: Node2D = self.get_parent()
onready var interaction_receiver_area_2d: Area2D = $InteractionReceiverArea2D
onready var collision_shape_2d: CollisionShape2D = $InteractionReceiverArea2D/CollisionShape2D
onready var animation_player: AnimationPlayer = $AnimationPlayer


# Signals
signal interactable_enabled


# ----------------- RUN CODE -----------------


func _ready() -> void:
	self.initialize_signals()


# ----------------- DECLARE FUNCTIONS -----------------


func initialize_signals() -> void:
	if interaction_receiver_area_2d.connect("interaction_received", self, "_receive_interaction") != OK:
		printerr("(!) ERROR: In " + self.name + ": Connection to signal 'interaction_received' error.")
	if self.parent_manager.connect("invalid_sequence_order_given", self, "reset") != OK:
		printerr("(!) ERROR: In " + self.name + ": Connection to signal 'invalid_sequence_order_given' error.")


func _receive_interaction() -> void:
	animation_player.play("Press")
	self.set_enabled(false)
	self.emit_signal("interactable_enabled", {"id": self.id} )


func reset() -> void:
	animation_player.play("Unpress")
	set_enabled(true)


func set_enabled(enabled: bool) -> void:
	if enabled:
		collision_shape_2d.set_deferred("disabled", false)
	else:
		collision_shape_2d.set_deferred("disabled", true)
