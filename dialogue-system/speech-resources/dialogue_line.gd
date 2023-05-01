extends Resource
class_name DialogueLine

# Base script for the resource dialogue_line.tres
# The data fed in this resource file is the data which will be played in the 
# DialogueGUI by triggering a DialogueManager

# ----------------- DECLARE VARIABLES -----------------


export var message: String = ""
export var texture_left: StreamTexture = null
export var texture_right: StreamTexture = null
export var sound_file: AudioStream = null


# ---------------------- RUN CODE ---------------------

# ----------------- DECLARE FUNCTIONS -----------------
