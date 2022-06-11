class_name PlayerController
extends Node

# Node controlling the player inputs.
# Tightly coupled to the Hero scene.


# ----------------- DECLARE VARIABLES -----------------

onready var parent_node: KinematicBody2D = self.get_parent()


# ----------------- RUN CODE -----------------


func _ready() -> void:
	self.initialize_asserts()
	self.initialize_signals()
	self.initialize()
	return


func _physics_process(delta: float) -> void:
	parent_node.velocity = parent_node.move_and_slide(parent_node.velocity)
	return


func _unhandled_input(event: InputEvent) -> void:
	self.get_all_inputs()
	return


# ----------------- DECLARE FUNCTIONS -----------------


func initialize_asserts() -> void:
	# The parent node must be a Hero! (Verified by name, change it if needed)
	assert(parent_node is Hero)
	return


func initialize_signals() -> void:
	Events.connect("controlled_hero_switched", self, "on_controlled_hero_switched")
	return


func initialize() -> void:
#	self.toggle_enabled()
	return


func on_controlled_hero_switched() -> void:
#	self.toggle_enabled()
	return


#func toggle_enabled() -> void:
#	if parent_node.is_controlled:
#
#	else:
#		self.set_process_unhandled_input(true)
#	return


func set_enabled(enabled: bool) -> void:
	if enabled:
		self.set_process_unhandled_input(true)
	else:
		self.set_process_unhandled_input(false)
		
	return


func get_all_inputs() -> void:
	get_movement_input()
	return


func get_movement_input() -> void:
	parent_node.direction = Vector2(0.0, 0.0)
	parent_node.velocity = Vector2(0.0, 0.0)

	if Input.get_action_strength("move_left"):
		parent_node.direction.x = -1
	if Input.is_action_pressed("move_right"):
		parent_node.direction.x = 1
	if Input.is_action_pressed("move_up"):
		parent_node.direction.y = -1
	if Input.is_action_pressed("move_down"):
		parent_node.direction.y = 1

	parent_node.velocity = parent_node.direction.normalized() * parent_node.speed
	return
