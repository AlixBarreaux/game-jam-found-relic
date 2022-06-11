class_name NoteBlockAudioStreamPlayer2D
extends AudioStreamPlayer2D


# ----------------- DECLARE VARIABLES -----------------



# ----------------- RUN CODE -----------------

func _ready() -> void:
	self.play()

# ----------------- DECLARE FUNCTIONS -----------------


func _on_NoteBlock_interactable_enabled(_order_id: int) -> void:
	self.play()
	print("Play!")
	return
