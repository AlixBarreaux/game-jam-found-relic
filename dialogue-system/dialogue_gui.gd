extends Control
class_name DialogueGUI


# ----------------- DECLARE VARIABLES -----------------


# Node References:
export var speech_texture_rect_node_path: NodePath = NodePath("")
export var speech_message_rich_text_label_node_path: NodePath = NodePath("")
export var speech_sound_player_node_path: NodePath = NodePath("")
export var animation_tree_node_path: NodePath = NodePath("")

onready var speech_texture_rect: TextureRect = get_node(speech_texture_rect_node_path)
onready var speech_message_rich_text_label: RichTextLabel = get_node(speech_message_rich_text_label_node_path)
onready var speech_sound_player: AudioStreamPlayer = get_node(speech_sound_player_node_path)
onready var animation_tree = get_node(animation_tree_node_path)
onready var animation_tree_anim_node_state_machine_playback = get_node(animation_tree.get_path()).get("parameters/playback")


# Variables
onready var dialogue: Resource = null
var speech_index_increment: int = 0


# ---------------------- RUN CODE ---------------------


func _ready() -> void:
	self._initialize_asserts()
	self._initialize()


func _initialize_asserts () -> void:
	assert(speech_texture_rect_node_path != "")
	assert(speech_message_rich_text_label_node_path != "")
	assert(speech_sound_player_node_path != "")


func _initialize() -> void:
	if not Settings.is_dialogue_system_enabled:
		self.queue_free()
		return
	
	toggle_enabled(false)
	animation_tree.set_active(true)
	return


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
		if is_last_speech:
			animation_tree_anim_node_state_machine_playback.travel("End")
			return
		
		play_next_speech()
		get_tree().set_input_as_handled()


# ----------------- DECLARE FUNCTIONS -----------------


func unload_active_speech_line_data() -> void:
	speech_message_rich_text_label.bbcode_text = ""
	speech_texture_rect.texture = null
	speech_sound_player.stop()
	speech_sound_player.stream = null


# This helps knowing which animation to play when ending the dialogue
var is_last_speech: bool = false

func play_next_speech() -> void:	
	if speech_index_increment == ( dialogue.data.size() -1 ):
		is_last_speech = true
		play_speech_at_index(speech_index_increment)
		speech_index_increment = 0
		return
	
	play_speech_at_index(speech_index_increment)
	speech_index_increment += 1


func play_speech_at_index(speech_to_play_index: int) -> void:
	unload_active_speech_line_data()
	
	speech_message_rich_text_label.bbcode_text = dialogue.data[speech_to_play_index].message
	
	if dialogue.data[speech_index_increment].texture != null:
		speech_texture_rect.texture = dialogue.data[speech_index_increment].texture
	
	if dialogue.data[speech_index_increment].sound_file != null:
		speech_sound_player.stream = dialogue.data[speech_index_increment].sound_file
		speech_sound_player.play()


func stop() -> void:
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

