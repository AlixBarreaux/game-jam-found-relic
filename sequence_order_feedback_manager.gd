class_name SequenceOrderSpritesFeedbackManager
extends Node2D


# ----------------- DECLARE VARIABLES -----------------



# ----------------- RUN CODE -----------------


func _ready() -> void:
	self.initialize_signals()
	return


# ----------------- DECLARE FUNCTIONS -----------------


func initialize_signals() -> void:
	Events.connect("good_interaction_sent", self, "on_good_interaction_sent")
	Events.connect("wrong_interaction_sent", self, "on_wrong_interaction_sent")
	Events.connect("level_completed", self, "on_level_completed")
	return


var current_enabled_nodes_index: int = 0

onready var lines_2d: Node2D = $Lines2D
onready var sprites: Node2D = $Sprites

func on_good_interaction_sent() -> void:
	sprites.get_child(current_enabled_nodes_index).enable()
	lines_2d.get_child(current_enabled_nodes_index).enable()
	current_enabled_nodes_index += 1
	return


func on_wrong_interaction_sent() -> void:
	get_tree().call_group("sequence_order_feedback_node", "disable")
	current_enabled_nodes_index = 0
	return


func on_level_completed() -> void:
	get_tree().call_group("sequence_order_feedback_node", "on_win")
	return
