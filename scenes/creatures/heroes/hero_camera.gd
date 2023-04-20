class_name HeroCamera
extends Camera2D


# ----------------- DECLARE VARIABLES -----------------


onready var hero: KinematicBody2D = self.get_parent()


# ----------------- RUN CODE -----------------


func _ready() -> void:
	self.initialize_signals()
	current = hero.is_controlled


# ----------------- DECLARE FUNCTIONS -----------------


func initialize_signals() -> void:
	if Events.connect("controlled_hero_switched", self, "on_controlled_hero_switched") != OK:
		printerr("(!) ERROR: In " + self.name + ": Connection to signal 'controlled_hero_switched' error.")


func on_controlled_hero_switched() -> void:
	current = !hero.is_controlled
