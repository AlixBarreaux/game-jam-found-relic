extends Control
class_name LevelTransition


# ----------------- DECLARE VARIABLES -----------------


onready var animation_player: AnimationPlayer = $AnimationPlayer


# ----------------- DECLARE FUNCTIONS -----------------


func _ready() -> void:
	self._initialize_signals()


func _initialize_signals() -> void:
	Events.connect("level_started", self, "on_level_started")
	Events.connect("level_completed", self, "on_level_completed")


func on_level_started() -> void:
	print(self.name, ": Level started!")
	animation_player.play("Reveal")


func on_level_completed() -> void:
	print(self.name, ": Level completed!")
	animation_player.play("Hide")
