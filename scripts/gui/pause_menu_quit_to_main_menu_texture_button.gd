class_name QuitToMainMenuTextureButton
extends SceneLoaderButton


# ----------------- DECLARE VARIABLES -----------------



# ----------------- RUN CODE -----------------



# ----------------- DECLARE FUNCTIONS -----------------


func _on_pressed() -> void:
	get_tree().paused = false
	var _scene_loading_error: int = get_tree().change_scene(self.scene_to_load_path)

	if _scene_loading_error != OK:
		printerr("(!) ERROR:" + self.name + ": The scene could not be loaded!")
	return
