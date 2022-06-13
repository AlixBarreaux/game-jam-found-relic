class_name Level
extends Node2D


# ----------------- DECLARE VARIABLES -----------------

export var next_level_to_load_path: String = ""

# ----------------- RUN CODE -----------------


func _ready() -> void:
	self.initialize_asserts()
	self.initialize_signals()
	return


# ----------------- DECLARE FUNCTIONS -----------------


func initialize_asserts() -> void:
	if next_level_to_load_path == "":
		printerr(self.name + " next_level_to_load_path is not set in the inspector!")


func initialize_signals() -> void:
	Events.connect("next_scene_load_requested", self, "on_next_scene_load_requested")
	return


func on_next_scene_load_requested() -> void:
	print(self.name, ": Scene load requested!")
	get_tree().change_scene(self.next_level_to_load_path)
	return
