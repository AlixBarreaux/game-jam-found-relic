extends Node
class_name DialogueManager

# This is the node "sending" the dialogue data to the DialogueGUI present in the
# Level derived scene. (EG: Level1.tscn)
# It takes in a dialogue_data resource file.
# GUI node = DialogueGUI in the Level scene.


# ----------------- DECLARE VARIABLES -----------------


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
	assert(self.dialogue_data_resource.data != [])


# Override to do something on ready rather than overriding ready and not 
# executing the _ready() function
func _custom_on_ready() -> void:
	return


# The _arguments are not actually used: Game jam code architecture bottleneck.
# It's only an argument which prevents a signal error.
# Just provide 0 as an argument if you want to call this method directly.
func _send_dialogue(_arguments) -> void:
	dialogue_gui.receive_dialogue(dialogue_data_resource)
