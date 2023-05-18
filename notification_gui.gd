extends Control
class_name NotificationGUI



# ----------------- DECLARE VARIABLES -----------------


onready var key_icon: TextureRect = $Panel/KeyIcon
onready var label: Label = $Panel/Label
onready var animation_player: AnimationPlayer = $AnimationPlayer


# ----------------- DECLARE FUNCTIONS -----------------


func _ready() -> void:
	Input.connect("joy_connection_changed", self, "on_joy_connection_changed")
	
	print(Input.get_joy_name(0))
	if Input.get_connected_joypads() != []:
		pass


func on_joy_connection_changed(device: int, connected: bool) -> void:
	print("Gamepad #", device, " | Connected: ", connected)


# SHOULD IT BE TRIGGERED BY THE ACTION ASKED BY THE TUTORIAL? (EG: Arrow keys)

#func _gui_input(event: InputEvent) -> void:
#	if event is InputEventMouseButton:
#		if (event.get_button_index() == 1) or (event.get_button_index() == 2):
#			if not event.is_pressed():
#				on_input_triggered()
#
#
#func _unhandled_input(_event: InputEvent) -> void:
#	if Input.is_action_just_released("ui_confirm_dialogue"):
#		self.on_input_triggered()


func on_input_triggered() -> void:
	animation_player.play("Hide")
	get_tree().set_input_as_handled()
