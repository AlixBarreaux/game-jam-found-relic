extends Node
class_name NotificationManagersManager


# ----------------- DECLARE VARIABLES -----------------


export var notification_gui_node_path: NodePath = ""
onready var notification_gui: NotificationGUI = get_node(self.notification_gui_node_path)


# ----------------- DECLARE FUNCTIONS -----------------


func _ready() -> void:
	self._initialize_asserts()


func _initialize_asserts() -> void:
	assert(self.notification_gui_node_path != "")
