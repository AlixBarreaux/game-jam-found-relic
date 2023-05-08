extends Node
class_name DialogueManagersManager


# ----------------- DECLARE VARIABLES -----------------


export var dialogue_gui_node_path: NodePath = ""
onready var dialogue_gui: DialogueGUI = get_node(self.dialogue_gui_node_path)


# ----------------- DECLARE FUNCTIONS -----------------


func _ready() -> void:
	self._initialize_asserts()


func _initialize_asserts() -> void:
	assert(self.dialogue_gui_node_path != "")
