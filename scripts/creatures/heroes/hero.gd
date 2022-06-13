class_name Hero
extends KinematicBody2D


# ----------------- DECLARE VARIABLES -----------------

export var is_controlled: bool = true

export var speed: float = 250.0

var direction: Vector2 = Vector2(0.0, 0.0)
var velocity: Vector2 = Vector2(0.0, 0.0)

onready var animation_tree: AnimationTree = $AnimationTree
onready var animation_tree_node_sm_playback = animation_tree.get("parameters/playback")


# ----------------- RUN CODE -----------------


func _ready() -> void:
	self.initialize_signals()
	self.initialize()
	return


func _physics_process(delta: float) -> void:
	if not self.velocity == Vector2(0.0, 0.0):
		# Set the animation Tree to play Animation Move with the velocity
		self.animation_tree.set("parameters/Move/blend_position", self.velocity)
		self.animation_tree_node_sm_playback.travel("Move")
	else:
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
	animation_tree_node_sm_playback.travel("CelebrateVictoryMove")
#	$AnimationPlayer.play("CelebrateVictory")
	return
