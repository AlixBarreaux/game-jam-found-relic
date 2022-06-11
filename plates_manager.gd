class_name PlatesManager
extends Node2D


# ----------------- DECLARE VARIABLES -----------------

var last_plate_order_id: int = 0

signal invalid_sequence_order_given

# ----------------- RUN CODE -----------------

func _ready() -> void:
	self.initialize_signals()
	self.initialize()
	return


# ----------------- DECLARE FUNCTIONS -----------------


func initialize_asserts() -> void:
#	printerr("At least 2 plates should be added to the PlateManager!")
	assert(self.get_child_count() >= 2)
	
#	printerr("The children of this node should be plates only!")
#	for plate in self.get_children():
#		assert(plate is Plate)


func initialize_signals() -> void:
	for plate in self.get_children():
		plate.connect("plate_enabled", self, "on_plate_enabled")
	return


func initialize() -> void:
	var _plate_id_increment: int = 0
	for plate in self.get_children():
		_plate_id_increment += 1
		plate.order_id = _plate_id_increment
		
		print(self.name, " Generated plate order ID: ", plate.order_id)
	return


# Check if the plate order is right when a plate is enabled
func on_plate_enabled(plate_order_id: int) -> void:
	if plate_order_id == last_plate_order_id + 1:
		print("Good sequence:")
		print("Received plate ID: ", plate_order_id, " | Last plate ID: ", last_plate_order_id)
		last_plate_order_id = plate_order_id
		
		if plate_order_id == self.get_child_count():
			Events.emit_signal("level_completed")
		
	else:
		print("Wrong sequence:")
		print("Received plate ID: ", plate_order_id, " | Last plate ID: ", last_plate_order_id)
		self.reset_all_plates()
	return


func reset_all_plates() -> void:
	last_plate_order_id = 0
	self.emit_signal("invalid_sequence_order_given")
	return
