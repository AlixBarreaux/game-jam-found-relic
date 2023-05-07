extends DialogueManager
class_name DialogueManagerInteractableGoodSequence

# This is the node "sending" the dialogue data to the DialogueGUI present in the
# Level derived scene. (EG: Level1.tscn)
# It takes in a dialogue_data resource file.
# GUI node = DialogueGUI in the Level scene.


# ----------------- DECLARE VARIABLES -----------------



# ---------------------- RUN CODE ---------------------


func _ready() -> void:
	Events.connect("good_interaction_sent", self, "send_trigger", [0])


# ----------------- DECLARE FUNCTIONS -----------------


#func _custom_on_ready() -> void:
#	assert(parent_node is PlatesManager)
