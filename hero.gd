class_name Hero
extends KinematicBody2D


# ----------------- DECLARE VARIABLES -----------------

export var speed: float = 250.0

var direction: Vector2 = Vector2(0.0, 0.0)
var velocity: Vector2 = Vector2(0.0, 0.0)

# ----------------- RUN CODE -----------------

func _physics_process(delta: float) -> void:
#	get_all_inputs()
	
#	velocity = move_and_slide(velocity)
	return

# ----------------- DECLARE FUNCTIONS -----------------



#func get_all_inputs() -> void:
#	direction = Vector2(0.0, 0.0)
#	velocity = Vector2(0.0, 0.0)
#
#	if Input.get_action_strength("move_left"):
#		direction.x = -1
#	if Input.is_action_pressed("move_right"):
#		direction.x = 1
#	if Input.is_action_pressed("move_up"):
#		direction.y = -1
#	if Input.is_action_pressed("move_down"):
#		direction.y = 1
#
#	velocity = direction.normalized() * speed
#
#	return
#
