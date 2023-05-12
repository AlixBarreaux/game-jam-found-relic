# class_name Events
extends Node


# Singleton events sender. Scenes can call the singleton to send one of its signal
# so that other scenes receive the signal and react to it.


# ----------------- DECLARE VARIABLES -----------------


# warning-ignore: unused_signal
signal controlled_hero_switched
# warning-ignore: unused_signal
signal level_started
# warning-ignore: unused_signal
signal level_completed
# warning-ignore: unused_signal
signal next_scene_load_requested

# warning-ignore: unused_signal
signal dialogue_gui_disabled
# warning-ignore: unused_signal
signal dialogue_gui_enabled

# warning-ignore: unused_signal
signal good_interaction_sent
# warning-ignore: unused_signal
signal wrong_interaction_sent

# warning-ignore: unused_signal
signal wrong_interaction_track_finished


# ----------------- RUN CODE -----------------



# ----------------- DECLARE FUNCTIONS -----------------

