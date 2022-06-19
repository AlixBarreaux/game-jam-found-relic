class_name TutorialSpaceBarSprite
extends Sprite


# ----------------- DECLARE VARIABLES -----------------


#export var gamepad_texture: StreamTexture = null
#export var keyboard_texture: StreamTexture = null
#
#
#onready var key_sprite = $Key

# ----------------- RUN CODE -----------------


func _ready() -> void:
#	self.initialize_asserts()
#	self.initialize_signals()
#
#	on_joy_connection_changed(0, true)
	self.hide()
	return


#func initialize_asserts() -> void:
#	if gamepad_texture == null:
#		printerr("(!) ERROR: In " + self.name + " gamepad_texture can't be null")
#	if keyboard_texture == null:
#		printerr("(!) ERROR: In " + self.name + " keyboard_texture can't be null")
#	return


#func initialize_signals() -> void:
#	Input.connect("joy_connection_changed", self, "on_joy_connection_changed")
#	return


func _unhandled_key_input(_event: InputEventKey) -> void:
	if Input.get_action_strength("switch_characters"):
		self.queue_free()
	return


# ----------------- DECLARE FUNCTIONS -----------------


func _on_SpaceBarTutorialArea2D_body_entered(_body: PhysicsBody2D) -> void:
	self.show()
	return


#func on_joy_connection_changed(device: int, connected: bool) -> void:
#
#	if Input.get_connected_joypads() != []:
#		key_sprite.texture = gamepad_texture
#	else:
#		key_sprite.texture = keyboard_texture
#
#	return
