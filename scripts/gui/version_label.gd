class_name VersionLabel
extends Label


# ----------------- DECLARE VARIABLES -----------------

export var text_prefix: String = "Version: "

# ----------------- RUN CODE -----------------


func _ready() -> void:
	self.text = text_prefix + ProjectSettings.get("application/config/version")
	return


# ----------------- DECLARE FUNCTIONS -----------------

