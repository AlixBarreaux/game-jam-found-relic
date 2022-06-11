class_name PlayerController
extends Node

# Node controlling the player inputs.
# Tightly coupled to the Hero scene.


# ----------------- DECLARE VARIABLES -----------------


export var is_controlled: bool = true

onready var parent_node: KinematicBody2D = self.get_parent()


# ----------------- RUN CODE -----------------


func _ready() -> void:
	self.initialize_asserts()
	self.initialize_signals()
	self.initialize()
	return


func _physics_process(delta: float) -> void:
	if not is_controlled:
		return
	
	parent_node.velocity = parent_node.move_and_slide(parent_node.velocity)
	return


func _unhandled_input(_event: InputEvent) -> void:
	if self.is_controlled:
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
	self.toggle_enabled()
	return


func on_controlled_hero_switched() -> void:
	self.toggle_enabled()
	return


func get_all_inputs() -> void:
	get_switch_characters_input()
	get_movement_input()
	return


func get_movement_input() -> void:
	parent_node.direction = Vector2(0.0, 0.0)
	parent_node.velocity = Vector2(0.0, 0.0)

	if Input.get_action_strength("move_left"):
		parent_node.direction.x = -1
	if Input.get_action_strength("move_right"):
		parent_node.direction.x = 1
	if Input.get_action_strength("move_up"):
		parent_node.direction.y = -1
	if Input.get_action_strength("move_down"):
		parent_node.direction.y = 1

	parent_node.velocity = parent_node.direction.normalized() * parent_node.speed
	return


func get_switch_characters_input() -> void:
	if Input.is_action_just_pressed("switch_characters"):
		Events.emit_signal("controlled_hero_switched")
	return


func toggle_enabled() -> void:
	self.is_controlled = !self.is_controlled
	self.set_process_unhandled_input(is_controlled)
	print("Toggle enabled result: ", self.is_processing_unhandled_input())
	return
