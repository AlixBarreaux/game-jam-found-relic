class_name SceneLoaderButton
extends Control


# ----------------- DECLARE VARIABLES -----------------


export var scene_to_load_path: String = ""


# ----------------- RUN CODE -----------------


func _ready() -> void:
	initialize_asserts()
	return


# ----------------- DECLARE FUNCTIONS -----------------


func initialize_asserts() -> void:
	if scene_to_load_path == "":
		printerr("scene_to_load_path is empty! Please add a correct one.")
	return


func _on_pressed() -> void:
	var _scene_loading_error: int = get_tree().change_scene(self.scene_to_load_path)

	if _scene_loading_error != OK:
		printerr("(!) ERROR:" + self.name + ": The scene could not be loaded!")
	return
