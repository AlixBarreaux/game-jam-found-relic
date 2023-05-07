class_name SequenceOrderInteractablesManager
extends Node2D


# ----------------- DECLARE VARIABLES -----------------


var last_interactable_order_id: int = 0

signal invalid_sequence_order_given


# ----------------- RUN CODE -----------------


func _ready() -> void:
	self.initialize_signals()
	self.initialize()


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


func initialize() -> void:
	var _interactable_id_increment: int = 0
	for interactable in self.get_children():
		_interactable_id_increment += 1
		interactable.id = _interactable_id_increment


# Check if the interactables are enabled in the right order
# Overriden in its extended classes
func on_interactable_enabled(signal_args: Dictionary) -> void:
	var _interactable_order_id: int = signal_args.id
	
	if _interactable_order_id == last_interactable_order_id + 1:
		print("Good sequence:")
		print("Received interactable ID: ", _interactable_order_id, " | Last interactable ID: ", last_interactable_order_id)
		last_interactable_order_id = _interactable_order_id
		
		if _interactable_order_id == self.get_child_count():
			Events.emit_signal("level_completed")
		
	else:
		print("Wrong sequence:")
		print("Received interactable ID: ", _interactable_order_id, " | Last interactable ID: ", last_interactable_order_id)
		self.reset_all_interactables()


func reset_all_interactables() -> void:
	last_interactable_order_id = 0
	self.emit_signal("invalid_sequence_order_given")
