class_name Level
extends Node2D


# ----------------- DECLARE VARIABLES -----------------



# ----------------- RUN CODE -----------------


func _ready() -> void:
	self.initialize_signals()
	return


# ----------------- DECLARE FUNCTIONS -----------------


func initialize_signals() -> void:
	Events.connect("level_completed", self, "on_level_completed")
	return


func on_level_completed() -> void:
	print("Level completed!")
	return
