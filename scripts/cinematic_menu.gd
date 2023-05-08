class_name CinematicMenu
extends Control


# ----------------- DECLARE VARIABLES -----------------

export var scene_to_load_path: String = ""
export var is_end_scene: bool = false

onready var animation_tree: AnimationTree = $AnimationTree


# ----------------- RUN CODE -----------------


func _ready() -> void:
	self.initialize_asserts()
	
	animation_tree.active = true
	return


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if (event.get_button_index() == 1) or (event.get_button_index() == 2):
			if not event.is_pressed():
				on_input_triggered()


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey or InputEventJoypadButton:
		on_input_triggered()


# ----------------- DECLARE FUNCTIONS -----------------


func initialize_asserts() -> void:
	if scene_to_load_path == "":
		printerr("(!) ERROR: In " + self.name + ": scene_to_load_path is empty!")
	

func on_input_triggered() -> void:
	if is_end_scene:
		MenusMusic.play()
		MenusMusic.has_been_played_at_least_once = true
	
	var _scene_loading_error: int = get_tree().change_scene(self.scene_to_load_path)

	if _scene_loading_error != OK:
		printerr("(!) ERROR:" + self.name + ": The scene could not be loaded!")
