class_name SceneLoaderButton
extends Control


# ----------------- DECLARE VARIABLES -----------------

export var is_visibility_manager: bool = false
export var scene_to_load_path: String = ""


# ----------------- RUN CODE -----------------


func _ready() -> void:
	initialize_asserts()
	
	if is_visibility_manager:
		self.disconnect("pressed", self, "_on_pressed")
	return


# ----------------- DECLARE FUNCTIONS -----------------


func initialize_asserts() -> void:
	if scene_to_load_path == "":
		if is_visibility_manager:
			return
		printerr("scene_to_load_path is empty! Please add a correct one.")
	return


func _on_pressed() -> void:
	var _scene_loading_error: int = get_tree().change_scene(self.scene_to_load_path)

	if _scene_loading_error != OK:
		printerr("(!) ERROR:" + self.name + ": The scene could not be loaded!")
	return
