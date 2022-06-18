class_name Level
extends Node2D

# Please note this script was copy pasted in level 1 and 2 because I didn't have
# time to make a fancy OOP pattern. It NEEDS to be refactored 100%. Like...
# Really. It needs to.

# ----------------- DECLARE VARIABLES -----------------


export var next_level_to_load_path: String = ""

onready var level_loading_transition_timer: Timer = $LevelLoadingTransitionTimer


# ----------------- RUN CODE -----------------


func _ready() -> void:
	self.initialize_asserts()
	self.initialize_signals()
	return


# ----------------- DECLARE FUNCTIONS -----------------


func initialize_asserts() -> void:
	if next_level_to_load_path == "":
		printerr(self.name + " next_level_to_load_path is not set in the inspector!")
	return


func initialize_signals() -> void:
	Events.connect("next_scene_load_requested", self, "on_next_scene_load_requested")
	return


# Avoid triggering the method twice since both characters call it
var is_scene_load_requested_already_asked: bool = false

func on_next_scene_load_requested() -> void:
	print(self.name, ": Scene load requested!")
	if is_scene_load_requested_already_asked:
		return
	is_scene_load_requested_already_asked = true
	level_loading_transition_timer.start()
	return


func _on_LevelLoadingTransitionTimer_timeout() -> void:
	var _scene_loading_error: int = get_tree().change_scene(self.next_level_to_load_path)

	if _scene_loading_error != OK:
		printerr("(!) ERROR:" + self.name + ": The scene could not be loaded!")
	return
