extends Node
class_name DialogueManager


# ----------------- DECLARE VARIABLES -----------------


export var data: Array = [
	{
		"message": "Example Message 1",
		"sound_file_path": "res://example_sound.ogg",
		"texture_file_path": "res://assets/sprites/glass.png"
	}
]


# ---------------------- RUN CODE ---------------------

# ----------------- DECLARE FUNCTIONS -----------------

onready var dialogue_gui: Control = self.get_node("%DialogueGUI")

func send_dialogue(_arguments: Dictionary) -> void:
	print("Dialogue sender received signal to send with arguments:", _arguments)
	
	get_node("%DialogueGUI").receive_dialog(data)
	return
