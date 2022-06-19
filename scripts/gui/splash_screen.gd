class_name SplashScreen
extends Control


# ----------------- DECLARE VARIABLES -----------------

export var next_scene_to_load_path: String = ""

# ----------------- RUN CODE -----------------


func _ready() -> void:
	self.initialize_asserts()
	return


# ----------------- DECLARE FUNCTIONS -----------------


func initialize_asserts() -> void:
	if next_scene_to_load_path == "":
		printerr("(!) ERROR: In " + self.name + ": The next scene to load path can't be empty!")
	return


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey or InputEventJoypadButton:
		self.load_next_scene()
	return


func load_next_scene() -> void:
	var _scene_loading_error: int = get_tree().change_scene(self.next_scene_to_load_path)

	if _scene_loading_error != OK:
		printerr("(!) ERROR:" + self.name + ": The scene could not be loaded!")
	return


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	self.load_next_scene()
	return
