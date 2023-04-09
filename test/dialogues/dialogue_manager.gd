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
		"texture_file_path": "res://assets/sprites/my_image.png"
	},
	{
		"message": "Example [b][i]Message[/i][/b] 2",
		"sound_file_path": "res://example_sound_two.ogg",
		"texture_file_path": "res://assets/sprites/my_image_two.png"
	}
]

# Node References
onready var parent_node: Node = self.get_parent()

export var dialogue_gui_node_path: NodePath = ""
onready var dialogue_gui: DialogueGUI = get_node(self.dialogue_gui_node_path)


# ---------------------- RUN CODE ---------------------


func _ready() -> void:
	self._initialize_asserts()
	self._initialize_signals()
	return


# ----------------- DECLARE FUNCTIONS -----------------


func _initialize_signals() -> void:
#	Example implementation to override this method
#	parent_node.connect("signal_with_dictionary_argument", self, "_send_dialogue")
	return


func _initialize_asserts() -> void:
	assert(self.dialogue_gui_node_path != "")
	assert(data != [])


# The _arguments are not actually used: Game jam code architecture bottleneck.
# It's only an argument which prevents a signal error.
func _send_dialogue(_arguments) -> void:
	dialogue_gui.receive_dialog(data)
