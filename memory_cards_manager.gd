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
	for card_group_node in self.get_children():
		for memory_card in card_group_node.get_children():
			memory_card.connect("interactable_enabled", self, "on_interactable_enabled")
	return


func initialize() -> void:
	return


#var cards_per_group_count: int = 2
var first_check: bool = true
var first_node_reference = null

# Check if the interactable order is right when a interactable is enabled
func on_interactable_enabled(card_node: Node) -> void:
	print(card_node.get_parent())
	
	if first_check:
		print("First check!")
		first_node_reference = card_node
	else:
		print("Second check!")
		
		if first_node_reference.get_parent() == card_node.get_parent():
			print("Cards are matching!")
		else:
			print("Cards are not matching!")
	
	first_check = !first_check
		
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


var last_card = null

# First time card is null. Must be reset to null as well.

#func compare_cards_validity(current_card) -> void:
#	print("Card to compare: ", current_card.name)
	
#	return


# ADD THE "TRAP" LONELY CARD
# ADD CHECKS TO GENERATE AT LEAST 1 GROUP AND 2 CARDS PER GROUP


#	for interactable in self.get_children():
#		_increment_counter += 1
#		_interactable_id_increment += 1
#		interactable.id = _interactable_id_increment
#
#		print(self.name, " Generated interactable order ID: ", interactable.id)
#	return


func reset_all_interactables() -> void:
#	last_interactable_order_id = 0
	self.emit_signal("invalid_sequence_order_given")
	return



# -----------------------------------------------------------------------------

# THE NEXT LINES OF THIS SCRIPT ARE THE START OF A SYSTEM TO RANDOMLY GENERATE
# GROUPS AND CARDS. IT IS STILL NOT FINISHED AT ALL!

#export var groups_to_generate_count: int = 8
#export var cards_by_group_count: int = 2


#export var textures_to_load: Array = []


#func initialize() -> void:
#	var _increment_counter = 0
#	var _interactable_id_increment: int = 0
#
#	var _card_group_node = null
#
#	for card_group in range(1, groups_to_generate_count +1):
#		print("Card group: ", card_group)
#		_card_group_node = self.add_group_node_to_scene_tree(card_group)
#
#		for card in range(1, cards_by_group_count +1):
#			print("Card: ", card)
#			self.add_memory_card_to_group(_card_group_node, card)
	
#	return




#export var vertical_spacing_between_cards: float = 100.0
#export var horizontal_spacing_between_cards: float = 100.0
#
#var last_vertical_global_position: float = 0.0
#var last_horizontal_global_position: float = 0.0


#func add_group_node_to_scene_tree(name_counter: int) -> Node:
#	var _node = Node2D.new()
#	_node.set_name("Group" + str(name_counter))
#	self.add_child(_node)
#
#	# Generate the Y position for the groupo
#	_node.global_position.y = last_vertical_global_position + vertical_spacing_between_cards
#	last_vertical_global_position += vertical_spacing_between_cards
##	print(_node.global_position)
#
#	return _node
	

#export var memory_card_scene: PackedScene = null
#
#func add_memory_card_to_group(assigned_group: Node, name_counter: int) -> void:
#	var _memory_card_instance = self.memory_card_scene.instance()
#	_memory_card_instance.set_name(_memory_card_instance.name + str(name_counter))
#
#	assigned_group.add_child(_memory_card_instance)
#
#	# Generate the X position for the card
#	_memory_card_instance.global_position.x = horizontal_spacing_between_cards * name_counter
##	last_horizontal_global_position += horizontal_spacing_between_cards
#	print(_memory_card_instance.global_position.x)
#
#	return
