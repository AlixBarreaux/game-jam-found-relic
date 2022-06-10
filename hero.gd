class_name Hero
extends KinematicBody2D


# ----------------- DECLARE VARIABLES -----------------

export var is_controlled: bool = true
export var speed: float = 250.0

var direction: Vector2 = Vector2(0.0, 0.0)
var velocity: Vector2 = Vector2(0.0, 0.0)

# ----------------- RUN CODE -----------------

func _physics_process(delta: float) -> void:
#	get_all_inputs()
	
#	velocity = move_and_slide(velocity)
	return

# ----------------- DECLARE FUNCTIONS -----------------

func initialize_signals() -> void:
	Events.connect("controlled_hero_switched", self, "on_controlled_hero_switched")
	return
