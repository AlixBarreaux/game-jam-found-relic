class_name NoteBlocksManager
extends SequenceOrderInteractablesManager


# ----------------- DECLARE VARIABLES -----------------



# ----------------- RUN CODE -----------------



# ----------------- DECLARE FUNCTIONS -----------------


func on_interactable_enabled(interactable_order_id: int) -> void:
	if interactable_order_id == last_interactable_order_id + 1:
		print("Good sequence:")
		print("Received interactable ID: ", interactable_order_id, " | Last interactable ID: ", last_interactable_order_id)
		last_interactable_order_id = interactable_order_id
		
		# WHAT CHANGES FROM BASE CLASS IS HERE:
		print(self.name, ": Sending signal good_interaction_sent !")
		Events.emit_signal("good_interaction_sent")
		
		if interactable_order_id == self.get_child_count():
			Events.emit_signal("level_completed")
		
	else:
		print("Wrong sequence:")
		print("Received interactable ID: ", interactable_order_id, " | Last interactable ID: ", last_interactable_order_id)
		self.reset_all_interactables()
		
		print(self.name, ": Sending signal wrong_interaction_sent !")
		Events.emit_signal("wrong_interaction_sent")
	return
