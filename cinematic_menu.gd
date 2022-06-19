class_name CinematicMenu
extends Control


# ----------------- DECLARE VARIABLES -----------------

export var scene_to_load_path: String = ""
export var is_end_scene: bool = false

# ----------------- RUN CODE -----------------


func _ready() -> void:
	self.initialize_asserts()
	return


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey or InputEventJoypadButton:
		
		if is_end_scene:
			MenusMusic.play()
			MenusMusic.has_been_played_at_least_once = true
		
		var _scene_loading_error: int = get_tree().change_scene(self.scene_to_load_path)

		if _scene_loading_error != OK:
			printerr("(!) ERROR:" + self.name + ": The scene could not be loaded!")
		return


# ----------------- DECLARE FUNCTIONS -----------------


func initialize_asserts() -> void:
	if scene_to_load_path == "":
		printerr("(!) ERROR: In " + self.name + ": scene_to_load_path is empty!")
	return
