extends Control
class_name DialogueGUI


# ----------------- DECLARE VARIABLES -----------------

# ---------------------- RUN CODE ---------------------

func _ready() -> void:
	self.hide()
	return

# ----------------- DECLARE FUNCTIONS -----------------


func receive_dialog(data: Array) -> void:
	print(data)
	self.show()
	$LabelMessage.text = data[1].message
	$TextureRect.texture = load(data[1].texture_file_path)
	return
