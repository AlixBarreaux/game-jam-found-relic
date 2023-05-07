class_name MemoryCardsManager
extends Node2D


# ----------------- DECLARE VARIABLES -----------------

#var last_interactable_order_id: int = 0

#signal invalid_sequence_order_given

# ----------------- RUN CODE -----------------

func _ready() -> void:
	self.initialize_signals()
	self._initialize()


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
			memory_card.connect("life_cycle_finished", self, "on_card_life_cycle_finished")


func _initialize() -> void:
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
			Events.emit_signal("good_interaction_sent")
			card_node.finish_life_cycle()
			first_node_reference.finish_life_cycle()
		else:
			print("Cards are not matching!")
			Events.emit_signal("wrong_interaction_sent")
			
			# RESET BOTH CARDS
			card_node.reset()
			first_node_reference.reset()
	
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


export var is_lone_card_present: bool = true
var cards_per_group_count: int = 2

var is_win_check_already_done: bool = false

func on_card_life_cycle_finished() -> void:
	var _victory_counter: int = self.cards_per_group_count # If there is no card left or the lone one
	var _nodes_counter: int = 0
	
	if is_lone_card_present:
		_victory_counter += 1
	
	for card_group_node in self.get_children():
#		print("card_group_node loop", card_group_node)
		for memory_card in card_group_node.get_children():
			_nodes_counter += 1
#
#			print("_nodes_counter: ", _nodes_counter)
	
	if not is_win_check_already_done:
		if _nodes_counter <= _victory_counter:
			is_win_check_already_done = true
			Events.emit_signal("level_completed")
	return

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


#func reset_all_interactables() -> void:
##	last_interactable_order_id = 0
#	self.emit_signal("invalid_sequence_order_given")
#	return
