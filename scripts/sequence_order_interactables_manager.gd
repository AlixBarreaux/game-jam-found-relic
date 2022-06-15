class_name SequenceOrderInteractablesManager
extends Node2D


# ----------------- DECLARE VARIABLES -----------------

var last_interactable_order_id: int = 0

signal invalid_sequence_order_given

# ----------------- RUN CODE -----------------

func _ready() -> void:
	self.initialize_signals()
	self.initialize()
	return


# ----------------- DECLARE FUNCTIONS -----------------


func initialize_asserts() -> void:
#	printerr("At least 2 interactables should be added to the interactableManager!")
	assert(self.get_child_count() >= 2)
	
#	printerr("The children of this node should be interactables only!")
#	for interactable in self.get_children():
#		assert(interactable is interactable)


func initialize_signals() -> void:
	for interactable in self.get_children():
		interactable.connect("interactable_enabled", self, "on_interactable_enabled")
	return


func initialize() -> void:
	var _interactable_id_increment: int = 0
	for interactable in self.get_children():
		_interactable_id_increment += 1
		interactable.id = _interactable_id_increment
		
		print(self.name, " Generated interactable order ID: ", interactable.id)
	return


# Check if the interactable order is right when a interactable is enabled
# Overriden in its extended classes
func on_interactable_enabled(interactable_order_id: int) -> void:
	if interactable_order_id == last_interactable_order_id + 1:
		print("Good sequence:")
		print("Received interactable ID: ", interactable_order_id, " | Last interactable ID: ", last_interactable_order_id)
		last_interactable_order_id = interactable_order_id
		
		if interactable_order_id == self.get_child_count():
			Events.emit_signal("level_completed")
		
	else:
		print("Wrong sequence:")
		print("Received interactable ID: ", interactable_order_id, " | Last interactable ID: ", last_interactable_order_id)
		self.reset_all_interactables()
	return


func reset_all_interactables() -> void:
	last_interactable_order_id = 0
	self.emit_signal("invalid_sequence_order_given")
	return
