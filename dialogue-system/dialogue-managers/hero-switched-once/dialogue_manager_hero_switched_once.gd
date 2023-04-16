extends DialogueManager
class_name DialogueManagerHeroSwitchedOnce


# ----------------- DECLARE VARIABLES -----------------



# ---------------------- RUN CODE ---------------------



# ----------------- DECLARE FUNCTIONS -----------------


func _custom_on_ready() -> void:
	Events.connect("controlled_hero_switched", self, "_send_dialogue", [0])
