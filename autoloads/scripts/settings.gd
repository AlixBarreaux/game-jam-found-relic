extends Node


# ----------------- DECLARE VARIABLES -----------------



# ----------------- RUN CODE -----------------


func _ready() -> void:
	OS.set_window_maximized(true)
	TranslationServer.set_locale(OS.get_locale())
	return


# ----------------- DECLARE FUNCTIONS -----------------

