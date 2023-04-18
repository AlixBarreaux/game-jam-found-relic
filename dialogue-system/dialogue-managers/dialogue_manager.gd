extends Node
class_name DialogueManager

# 

# If a new entry is added in the base dictionary structure,
# update it in all the existing dialogues!
# Remember to translate the data fed here into the .po files!

# ----------------- DECLARE VARIABLES -----------------



# The dictionaries must share the same structure for their data.
# This dictionary is base structure you'll see in the Godot editor.
#var data: Array = [
##	{
##		"message": "Example [rainbow][shake]Message[/shake][/rainbow] 1",
##		"texture_file_path": "res://assets/sprites/my_image.png",
##		"sound_file_path": "res://example_sound.ogg"
##	},
##	{
##		"message": "Example [b][i]Message[/i][/b] 2",
##		"texture_file_path": "",
##		"sound_file_path": ""
##	},
##	{
##		"message": "Example [b][i]Message[/i][/b] 2",
##		"texture_file_path": "res://assets/sprites/my_image_two.png",
##		"sound_file_path": "res://example_sound_two.ogg"
##	}
#]

# Node References
onready var parent_node: Node = self.get_parent()

export var dialogue_gui_node_path: NodePath = ""
onready var dialogue_gui: DialogueGUI = get_node(self.dialogue_gui_node_path)


# ---------------------- RUN CODE ---------------------

export var dialogue_data_resource: Resource = null

func _ready() -> void:
	self._initialize_asserts()
	self._initialize_signals()
	self._custom_on_ready()


# ----------------- DECLARE FUNCTIONS -----------------


func _initialize_signals() -> void:
#	Example implementation to override this method
#	parent_node.connect("signal_with_dictionary_argument", self, "_send_dialogue")
	return


func _initialize_asserts() -> void:
	assert(self.dialogue_gui_node_path != "")
	assert(self.dialogue_data_resource != null)
#	assert(dialogue_data_resource.data != [])


# Override to do something on ready rather than overriding ready and not 
# executing the _ready() function
func _custom_on_ready() -> void:
	return


# The _arguments are not actually used: Game jam code architecture bottleneck.
# It's only an argument which prevents a signal error.
# Just provide 0 as an argument if you want to call this method directly.
func _send_dialogue(_arguments) -> void:
	dialogue_gui.receive_dialogue(dialogue_data_resource)
