class_name InteractArea2D
extends Area2D


# ----------------- DECLARE VARIABLES -----------------



# ----------------- RUN CODE -----------------



# ----------------- DECLARE FUNCTIONS -----------------


func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		# I'm sorry about this bad node reference but... Game Jam.
		if self.get_parent().is_controlled:
			var _overlapping_areas: Array = self.get_overlapping_areas()
			if _overlapping_areas != []:
				if _overlapping_areas[0] is NoteBlockTutorialArea2D:
					_overlapping_areas[0]._on_NoteBlock_interactable_enabled({})
				else:
					if _overlapping_areas[0].can_receive_interaction_from_area_2d:
						print(_overlapping_areas[0].name)
						_overlapping_areas[0]._receive_interaction()
