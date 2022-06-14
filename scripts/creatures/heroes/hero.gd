class_name Hero
extends KinematicBody2D


# ----------------- DECLARE VARIABLES -----------------

export var is_controlled: bool = true

export var speed: float = 330.0

var direction: Vector2 = Vector2(0.0, 0.0)
var velocity: Vector2 = Vector2(0.0, 0.0)

onready var animation_tree: AnimationTree = $AnimationTree
onready var animation_tree_node_sm_playback = animation_tree.get("parameters/playback")


# ----------------- RUN CODE -----------------


func _ready() -> void:
	self.initialize_signals()
	self.initialize()
	
	
	self.animation_tree.set("parameters/Idle/blend_position", Vector2(0, 1))
	self.animation_tree_node_sm_playback.travel("Idle")
	return


# Used to set the Idle blend position with the AnimationTree
var last_velocity: Vector2 = Vector2(0.0, 0.0)

func _physics_process(_delta: float) -> void:
	
	if not self.velocity == Vector2(0.0, 0.0):
		# Set the animation Tree to play Animation Move with the velocity
		self.animation_tree.set("parameters/Move/blend_position", self.velocity)
		self.animation_tree_node_sm_playback.travel("Move")
		
		self.last_velocity = self.velocity
	else:
		self.animation_tree.set("parameters/Idle/blend_position", self.last_velocity)
		self.animation_tree_node_sm_playback.travel("Idle")
	return


# ----------------- DECLARE FUNCTIONS -----------------


func initialize_signals() -> void:
	Events.connect("level_completed", self, "on_level_completed")
	return


func initialize() -> void:
	animation_tree.active = true
	return


func on_level_completed() -> void:
	print(self.name, ": Level completed!")
#	animation_tree_node_sm_playback.travel("CelebrateVictory")
	$AnimationPlayer.play("CelebrateVictory")
	return


func call_event_singleton_signal_next_scene_load_requested() -> void:
	Events.emit_signal("next_scene_load_requested")
	return
