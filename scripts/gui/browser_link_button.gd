class_name BrowserLinkButton
extends LinkButton


# ----------------- DECLARE VARIABLES -----------------


export var url: String = ""


# ----------------- RUN CODE -----------------


func _ready() -> void:
	self.initialize_asserts()
	return


# ----------------- DECLARE FUNCTIONS -----------------


func initialize_asserts() -> void:
	if self.url == "":
		printerr("ERROR: In" + self.name + ": The URL must be set!")
	return


func _on_pressed() -> void:
	if OS.shell_open(url) != OK:
		printerr("(!) ERROR: In " + self.name + ": OS.shell_open() error")
