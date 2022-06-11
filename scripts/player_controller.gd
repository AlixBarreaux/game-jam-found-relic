class_name PlayerController
extends Node

# Node controlling the player inputs.
# Tightly coupled to the Hero scene.


# ----------------- DECLARE VARIABLES -----------------




onready var hero: KinematicBody2D = self.get_parent()


# ----------------- RUN CODE -----------------


func _ready() -> void:
	self.initialize_asserts()
	self.initialize_signals()
	return


func _physics_process(delta: float) -> void:
	if not hero.is_controlled:
		return
	
	hero.velocity = hero.move_and_slide(hero.velocity)
	return


func _unhandled_input(_event: InputEvent) -> void:
	if hero.is_controlled:
		self.get_all_inputs()
	return


# ----------------- DECLARE FUNCTIONS -----------------


func initialize_asserts() -> void:
	# The parent node must be a Hero! (Verified by name, change it if needed)
	assert(hero is Hero)
	return


func initialize_signals() -> void:
	Events.connect("controlled_hero_switched", self, "on_controlled_hero_switched")
	return


func on_controlled_hero_switched() -> void:
	self.toggle_enabled()
	return


func get_all_inputs() -> void:
	get_switch_characters_input()
	get_movement_input()
	return


func get_movement_input() -> void:
	hero.direction = Vector2(0.0, 0.0)
	hero.velocity = Vector2(0.0, 0.0)

	if Input.get_action_strength("move_left"):
		hero.direction.x = -1
	if Input.get_action_strength("move_right"):
		hero.direction.x = 1
	if Input.get_action_strength("move_up"):
		hero.direction.y = -1
	if Input.get_action_strength("move_down"):
		hero.direction.y = 1

	hero.velocity = hero.direction.normalized() * hero.speed
	return


func get_switch_characters_input() -> void:
	if Input.is_action_just_pressed("switch_characters"):
		Events.emit_signal("controlled_hero_switched")
	return


func toggle_enabled() -> void:
	hero.is_controlled = !hero.is_controlled
	self.set_process_unhandled_input(hero.is_controlled)
	return
