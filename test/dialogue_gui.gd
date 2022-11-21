extends Control
class_name DialogueGUI


# ----------------- DECLARE VARIABLES -----------------

# ---------------------- RUN CODE ---------------------

func _ready() -> void:
	self._initialize()
	return


func _initialize() -> void:
	if not Settings.is_dialogue_system_enabled:
		self.queue_free()
		return
	
	toggle_enabled(false)
	return

func _unhandled_input(event: InputEvent) -> void:
	print(self.name, " Input detected")
	if event is InputEventMouse:
		if event is InputEventMouseButton:
			play_next_speech()
			get_tree().set_input_as_handled()
			self.set_process_unhandled_input(false)
		return
	
	if event is InputEventKey or InputEventJoypadButton:
		if not Input.is_action_just_pressed("ui_select"):
			return
		
#		elif not Input.is_action_just_pressed("ui_accept"):
#			return
		
		elif not Input.is_action_just_pressed("ui_down"):
			return
		
		elif not Input.is_action_just_pressed("move_down"):
			return
		
		elif not event is InputEventMouseButton:
			return
		
		
		play_next_speech()
#		get_tree().set_input_as_handled()
#		self.set_process_unhandled_input(false)
	return


# ----------------- DECLARE FUNCTIONS -----------------

var dialogue: Array = []
var speech_index: int = 0

func play_next_speech() -> void:
	$LabelMessage.text = dialogue[speech_index].message
	$TextureRect.texture = load(dialogue[speech_index].texture_file_path)
	
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
	print(data)
	dialogue = data
	
	toggle_enabled(true)
	play_next_speech()
	
	
	return


func toggle_enabled(enabled: bool) -> void:
	if enabled:
		self.show()
		self.set_process_unhandled_input(true)
	else:
		self.hide()
		self.set_process_unhandled_input(false)
