class_name SequenceOrderSpritesFeedbackManager
extends Node2D


# ----------------- DECLARE VARIABLES -----------------



# ----------------- RUN CODE -----------------


func _ready() -> void:
	self.initialize_signals()


# ----------------- DECLARE FUNCTIONS -----------------


func initialize_signals() -> void:
	if Events.connect("good_interaction_sent", self, "on_good_interaction_sent") != OK:
		printerr("(!) ERROR: In " + self.name + ": Connection to signal 'good_interaction_sent' error.")
	if Events.connect("wrong_interaction_sent", self, "on_wrong_interaction_sent") != OK:
		printerr("(!) ERROR: In " + self.name + ": Connection to signal 'wrong_interaction_sent' error.")
	if Events.connect("level_completed", self, "on_level_completed") != OK:
		printerr("(!) ERROR: In " + self.name + ": Connection to signal 'level_completed' error.")


var current_enabled_nodes_index: int = 0

onready var lines_2d: Node2D = $Lines2D
onready var sprites: Node2D = $Sprites

func on_good_interaction_sent() -> void:
	sprites.get_child(current_enabled_nodes_index).enable()
	lines_2d.get_child(current_enabled_nodes_index).enable()
	current_enabled_nodes_index += 1


func on_wrong_interaction_sent() -> void:
	get_tree().call_group("sequence_order_feedback_node", "disable")
	current_enabled_nodes_index = 0


func on_level_completed() -> void:
	get_tree().call_group("sequence_order_feedback_node", "on_win")
