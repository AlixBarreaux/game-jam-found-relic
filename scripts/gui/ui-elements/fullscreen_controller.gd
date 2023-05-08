class_name FullScreenController
extends HBoxContainer


# ----------------------------- DECLARE VARIABLES ------------------------------


onready var check_button: CheckButton = $CheckButton


# ---------------------------------- RUN CODE ----------------------------------


func _ready() -> void:
	self._initialize()


# ------------------------------ DECLARE FUNCTIONS -----------------------------


func _initialize() -> void:
	self.check_button.pressed = OS.is_window_fullscreen()


func _on_pressed() -> void:
	OS.set_window_fullscreen(!OS.is_window_fullscreen())
