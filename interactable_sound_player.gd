class_name InteractableSoundPlayer
extends AudioStreamPlayer


# ----------------- DECLARE VARIABLES -----------------

export var good_sound_path: String = ""

# ----------------- RUN CODE -----------------



# ----------------- DECLARE FUNCTIONS -----------------


func _on_SequenceOrderInteractable_interactable_enabled() -> void:
	self.play()
	return
