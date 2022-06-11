class_name HeroCamera
extends Camera2D


# ----------------- DECLARE VARIABLES -----------------

onready var hero: KinematicBody2D = self.get_parent()

# ----------------- RUN CODE -----------------

func _ready() -> void:
	current = hero.is_controlled
	print(current)
	return

# ----------------- DECLARE FUNCTIONS -----------------


func initialize_signals() -> void:
	Events.connect("controlled_hero_switched", self, "on_controlled_hero_switched")
	return


func on_controlled_hero_switched() -> void:
	clear_current()
	current = hero.is_controlled
	return
