extends Control
class_name DialogueGUI


# ----------------- DECLARE VARIABLES -----------------


# Node References:
onready var message_rich_text_label: RichTextLabel = $MessageRichTextLabel
onready var speaker_texture: TextureRect = $SpeakerTexture


# ---------------------- RUN CODE ---------------------


func _ready() -> void:
#	self._initialize()
	return


func _initialize() -> void:
	if not Settings.is_dialogue_system_enabled:
		self.queue_free()
		return
	
	toggle_enabled(false)
	return


func _input(event: InputEvent) -> void:
	# No idea why this event is registered bellow, so
	# have to explicitly say no to exclude it
	if event is InputEventMouseMotion:
		return
	
	
	
	
	if event is InputEventKey or InputEventJoypadButton:
		if Input.is_action_just_pressed("ui_select") or Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("move_down"):
			print(self.name, ": Input accepted!")
			play_next_speech()
			get_tree().set_input_as_handled()
			
	return
		
		
		
		
#		get_tree().set_input_as_handled()
#		self.set_process_unhandled_input(false)
	return


# ----------------- DECLARE FUNCTIONS -----------------

var dialogue: Array = []
var speech_index: int = 0


func play_next_speech() -> void:
	message_rich_text_label.bbcode_text = dialogue[speech_index].message
	speaker_texture.texture = load(dialogue[speech_index].texture_file_path)
	
	if speech_index == ( dialogue.size() -1 ):
		self.stop()
		return
	
	speech_index += 1
#	yield(get_tree().create_timer(2.0), "timeout")
#	play_next_speech()
	return


func stop() -> void:
	print(self.name, ": STOOOOOOOOOOOOOOOOOOOOP!")
	toggle_enabled(false)
	return


func receive_dialog(data: Array) -> void:
	dialogue = data
	toggle_enabled(true)
	play_next_speech()
	
	return


func toggle_enabled(enabled: bool) -> void:
	if enabled:
		self.show()
		self.set_process_input(true)
	else:
		self.hide()
		self.set_process_input(false)
