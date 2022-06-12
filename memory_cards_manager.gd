class_name MemoryCardsManager
extends Node2D


# ----------------- DECLARE VARIABLES -----------------

#var last_interactable_order_id: int = 0

signal invalid_sequence_order_given

# ----------------- RUN CODE -----------------

func _ready() -> void:
	self.initialize_signals()
	self.initialize()
	return


# ----------------- DECLARE FUNCTIONS -----------------


func initialize_asserts() -> void:
#	printerr("At least 2 interactables should be added to the interactableManager!")
#	assert(self.get_child_count() >= 2)
	
#	printerr("The children of this node should be interactables only!")
#	for interactable in self.get_children():
#		assert(interactable is interactable)
	return


func initialize_signals() -> void:
#	for interactable in self.get_children():
#		interactable.connect("interactable_enabled", self, "on_interactable_enabled")
	return


export var groups_to_generate_count: int = 8
export var cards_by_group_count: int = 2


func initialize() -> void:
	var _increment_counter = 0
	var _interactable_id_increment: int = 0
	
	var _card_group_node = null
	
	for card_group in range(1, groups_to_generate_count +1):
		print("Card group: ", card_group)
		_card_group_node = self.add_group_node_to_scene_tree(card_group)
		
		for card in range(1, cards_by_group_count +1):
			print("Card: ", card)
			self.add_memory_card_to_group(_card_group_node, card)
	
	return


func add_group_node_to_scene_tree(name_counter: int) -> Node:
	var _node = Node2D.new()
	_node.set_name("Group" + str(name_counter))
	self.add_child(_node)
	
	return _node
	

export var memory_card_scene: PackedScene = null

func add_memory_card_to_group(assigned_group: Node, name_counter: int) -> void:
	var _memory_card_instance = self.memory_card_scene.instance()
	_memory_card_instance.set_name(_memory_card_instance.name + str(name_counter))
	
	assigned_group.add_child(_memory_card_instance)
	return


# ADD THE "TRAP" LONELY CARD
# ADD CHECKS TO GENERATE AT LEAST 1 GROUP AND 2 CARDS PER GROUP


#	for interactable in self.get_children():
#		_increment_counter += 1
#		_interactable_id_increment += 1
#		interactable.id = _interactable_id_increment
#
#		print(self.name, " Generated interactable order ID: ", interactable.id)
	return


# Check if the interactable order is right when a interactable is enabled
func on_interactable_enabled(interactable_order_id: int) -> void:
#	if interactable_order_id == last_interactable_order_id + 1:
#		print("Good sequence:")
#		print("Received interactable ID: ", interactable_order_id, " | Last interactable ID: ", last_interactable_order_id)
#		last_interactable_order_id = interactable_order_id
#
#		if interactable_order_id == self.get_child_count():
#			Events.emit_signal("level_completed")
#
#	else:
#		print("Wrong sequence:")
#		print("Received interactable ID: ", interactable_order_id, " | Last interactable ID: ", last_interactable_order_id)
#		self.reset_all_interactables()
	return


func reset_all_interactables() -> void:
#	last_interactable_order_id = 0
	self.emit_signal("invalid_sequence_order_given")
	return
