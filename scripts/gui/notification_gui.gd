extends Control
class_name NotificationGUI


# ----------------- DECLARE VARIABLES -----------------


onready var key_icon: TextureRect = $Panel/KeyIcon
onready var label_top: Label = $Panel/LabelTop
onready var animation_player: AnimationPlayer = $AnimationPlayer


# ----------------- DECLARE FUNCTIONS -----------------


export var data_list_from_platform: Resource = null

var current_data: Resource = null
var current_index_in_data_set: int = 0

# Had problems accessing nested resources inside resource
# so this variable was created
onready var notifications_list = data_list_from_platform.notifications_list


func receive_notification(index: int) -> void:
	print(self.name, ": receive_notification(index) index: ", index)
	load_data_at_index(index)
	animation_player.play("Show")
	
#	print(self.name, ": Show Notification Panel!")


func load_data_at_index(index: int) -> void:
	print(self.name, "load_data_at_index index: ", index)
	current_data = notifications_list[index]

	key_icon.texture = current_data.texture
	label_top.text = current_data.label_top_text


func delete_notification() -> void:
	animation_player.play_backwards("Show")
