extends Control
class_name DialogueGUI


# ----------------- DECLARE VARIABLES -----------------


# Node References:
export var speaker_texture_node_path: NodePath = NodePath("")
export var message_rich_text_label_node_path: NodePath = NodePath("")
export var animation_tree_node_path: NodePath = NodePath("")

onready var speaker_texture: TextureRect = get_node(speaker_texture_node_path)
onready var message_rich_text_label: RichTextLabel = get_node(message_rich_text_label_node_path)
onready var animation_tree = get_node(animation_tree_node_path)
onready var animation_tree_anim_node_state_machine_playback = get_node(animation_tree.get_path()).get("parameters/playback")


# Variables
var dialogue: Resource = null
var speech_index_increment: int = 0


# ---------------------- RUN CODE ---------------------


func _ready() -> void:
	self._initialize()
	return


func _initialize() -> void:
	if not Settings.is_dialogue_system_enabled:
		self.queue_free()
		return
	
	toggle_enabled(false)
	animation_tree.set_active(true)
	return


var first_input_triggered_once: bool = false

#func _gui_input(event: InputEvent) -> void:
#	if event is InputEventMouseButton:
#		if (event.get_button_index() == 1) or (event.get_button_index() == 2):
#			if not event.pressed:
#				if not first_input_triggered_once:
#					first_input_triggered_once = true
#					return
#
#				if is_last_speech:
#					animation_tree_anim_node_state_machine_playback.travel("End")
#					return
#
#				play_next_speech()
#				self.accept_event()
#	return


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_released("ui_confirm_dialogue"): 
		if not event.pressed:
			if not first_input_triggered_once:
				first_input_triggered_once = true
				return
			
			if is_last_speech:
				animation_tree_anim_node_state_machine_playback.travel("End")
				return
			
			play_next_speech()
			get_tree().set_input_as_handled()
	return


# ----------------- DECLARE FUNCTIONS -----------------


# This helps knowing which animation to play when ending the dialogue
var is_last_speech: bool = false

func play_next_speech() -> void:
#	if dialogue.data[speech_index_increment].message != "":
#		message_rich_text_label.bbcode_text = dialogue.data[speech_index_increment].message
#
#
#	if dialogue.data[speech_index_increment].texture_file_path != "":
#		speaker_texture.texture = load(dialogue.data[speech_index_increment].texture_file_path)
	
#	if dialogue.data[speech_index_increment].sound_file_path != "":


	
#
	if speech_index_increment == ( dialogue.data.size() -1 ):
		is_last_speech = true
#		self.play_next_speech()
		print("Last speech detected, index: ", speech_index_increment)
		play_speech_at_index(speech_index_increment)
		speech_index_increment = 0
		return
	
#	if is_last_speech:
#		speech_index_increment = 0
#		self.play_speech_at_index( dialogue.data.size() -1 )
#		return

	print("NOT last speech, playing at index: ", speech_index_increment)
	play_speech_at_index(speech_index_increment)
	speech_index_increment += 1


func play_speech_at_index(speech_to_play_index: int) -> void:
	print(self.name, ": Playing speech at index: ", speech_to_play_index)
	message_rich_text_label.bbcode_text = dialogue.data[speech_to_play_index].message
#	$Panel/SpeakerTexture.texture = dialogue.data[speech_to_play_index].texture_file_path


func stop() -> void:
	print(self.name, ": The dialog has stopped, all speech lines have been played!")
	is_last_speech = false
	toggle_enabled(false)


func receive_dialog(data: Resource) -> void:
	dialogue = data
	toggle_enabled(true)
	play_next_speech()


func toggle_enabled(enabled: bool) -> void:
	if enabled:
		self.show()
		self.set_process_unhandled_input(true)
		animation_tree_anim_node_state_machine_playback.start("Start")
	else:
		self.hide()
		self.set_process_unhandled_input(false)
#		animation_tree_anim_node_state_machine_playback.travel("End")

