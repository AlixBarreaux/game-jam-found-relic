extends Node
class_name DialogueManager

# 

# If a new entry is added in the base dictionary structure,
# update it in all the existing dialogs!
# Remember to translate the data fed here into the .po files!

# ----------------- DECLARE VARIABLES -----------------

# The dictionaries must share the same structure for their data.
# This dictionary is base structure you'll see in the Godot editor.
export var data: Array = [
	{
		"message": "Example [rainbow][shake]Message[/shake][/rainbow] 1",
		"sound_file_path": "res://example_sound.ogg",
		"texture_file_path": "res://assets/sprites/glass.png"
	}
]

# Node References
onready var parent_node: Node = self.get_parent()
onready var dialogue_gui: Control = self.get_node("%DialogueGUI")


# ---------------------- RUN CODE ---------------------


func _ready() -> void:
	self._initialize()
	return


# ----------------- DECLARE FUNCTIONS -----------------


func _initialize() -> void:
	parent_node.connect("interactable_enabled", self, "send_dialogue")
	return


func initialize_asserts() -> void:
	assert(data != [])
	return


func send_dialogue(_arguments: Dictionary) -> void:
	get_node("%DialogueGUI").receive_dialog(data)
	return
