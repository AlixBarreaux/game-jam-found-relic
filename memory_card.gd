class_name MemoryCard
extends Node2D


# ----------------- DECLARE VARIABLES -----------------


var id: int = 0


# Node References
onready var parent_manager: Node2D = self.get_parent()
onready var interaction_receiver_area_2d: Area2D = $InteractionReceiverArea2D
onready var collision_shape_2d: CollisionShape2D = $InteractionReceiverArea2D/CollisionShape2D


# Signals
signal interactable_enabled


# ----------------- RUN CODE -----------------

onready var animation_tree: AnimationTree = $AnimationTree
onready var animation_tree_node_sm_playback = animation_tree.get("parameters/playback")

func _ready() -> void:
	self.initialize_signals()
	self.initialize()
	return


# ----------------- DECLARE FUNCTIONS -----------------


func initialize_signals() -> void:
	interaction_receiver_area_2d.connect("interaction_received", self, "_receive_interaction")
#	self.parent_manager.connect("invalid_sequence_order_given", self, "reset")
	return


func initialize() -> void:
	animation_tree.active = true
	return


func _receive_interaction() -> void:
	self.set_enabled(false)
	animation_tree_node_sm_playback.travel("ShowHeads")
	
	self.emit_signal("interactable_enabled", self)
	
	return


func reset() -> void:
	print(self.name + ": reset() !")
	animation_tree_node_sm_playback.travel("ShowInvalidCombination")
	set_enabled(true)


func set_enabled(enabled: bool) -> void:
	if enabled:
		collision_shape_2d.set_deferred("disabled", false)
	else:
		collision_shape_2d.set_deferred("disabled", true)
		
	return


signal life_cycle_finished

func finish_life_cycle() -> void:
	animation_tree_node_sm_playback.travel("ShowValidCombination")
	return

# Special function used as method track for AnimationPlayer: "ShowValidCombination"
func emit_signal_life_cycle_finished() -> void:
	emit_signal("life_cycle_finished")
	return
