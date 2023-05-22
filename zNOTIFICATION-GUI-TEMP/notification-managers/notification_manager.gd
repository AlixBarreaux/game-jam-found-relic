extends Node
class_name NotificationManager


# ----------------- DECLARE VARIABLES -----------------


export var data_index: int = 0


# Node References
onready var notification_gui: NotificationGUI = null


# ---------------------- RUN CODE ---------------------


func _ready() -> void:
	self._initialize_signals()


func on_notification_managers_manager_ready() -> void:
	notification_gui = self.get_parent().notification_gui
	self._custom_on_ready()


# ----------------- DECLARE FUNCTIONS -----------------


# @override
func _custom_on_ready() -> void:
	return


func _initialize_signals() -> void:
	get_parent().connect("ready", self, "on_notification_managers_manager_ready")




func send_notification_data(index: int) -> void:
	notification_gui.receive_notification(index)
	notification_gui.current_index_in_data_set = self.data_index


func send_notification_deletion() -> void:
	if notification_gui.current_index_in_data_set == self.data_index:
		notification_gui.delete_notification()
