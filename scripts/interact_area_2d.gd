class_name InteractArea2D
extends Area2D


# ----------------- DECLARE VARIABLES -----------------


export (NodePath) var player_controller_node_path = null
onready var player_controller = get_node(player_controller_node_path)


# ----------------- RUN CODE -----------------



# ----------------- DECLARE FUNCTIONS -----------------


func _ready() -> void:
	self._initialize_signals()


func _initialize_signals() -> void:
	player_controller.connect("interaction_input_pressed", self, "on_interaction_input_pressed")


func on_interaction_input_pressed() -> void:
	var _overlapping_areas: Array = self.get_overlapping_areas()
	if _overlapping_areas != []:
		if self.get_parent().get_parent().is_controlled:
			if _overlapping_areas[0].can_receive_interaction_from_area_2d:
				_overlapping_areas[0]._receive_interaction()
