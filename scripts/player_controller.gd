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


func _physics_process(_delta: float) -> void:
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
	Events.connect("level_completed", self, "on_level_completed")
	
	Events.connect("dialogue_gui_disabled", self, "enable")
	Events.connect("dialogue_gui_enabled", self, "disable")

func disable() -> void:
	self.set_process_unhandled_input(false)
	hero.velocity = Vector2(0.0, 0.0)

func enable() -> void:
	self.set_process_unhandled_input(true)


func on_controlled_hero_switched() -> void:
	self.toggle_enabled()


func on_level_completed() -> void:
	print(self.name, ": Level completed, disabling!")
	self.set_enabled(false)


func get_all_inputs() -> void:
	get_movement_input()
	get_switch_characters_input()
	get_interaction_input()


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


func get_switch_characters_input() -> void:
	if Input.is_action_just_pressed("switch_characters"):
		Events.emit_signal("controlled_hero_switched")


signal interaction_input_pressed

func get_interaction_input() -> void:
	if Input.is_action_just_pressed("interact"):
		self.emit_signal("interaction_input_pressed")


func set_enabled(enabled: bool) -> void:
	hero.is_controlled = enabled
	self.set_process_unhandled_input(enabled)


func toggle_enabled() -> void:
	hero.is_controlled = !hero.is_controlled
	self.set_process_unhandled_input(hero.is_controlled)
