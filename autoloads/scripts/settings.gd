extends Node


# ----------------- DECLARE VARIABLES -----------------


var is_dialogue_system_enabled: bool = true

enum JoypadTypes {
	NONE,
	UNKOWN
	XBOX,
	PLAYSTATION,
	NINTENDO_SWITCH,
}

var joypad_type: int = JoypadTypes.NONE

signal joypad_type_detected


# ----------------- RUN CODE -----------------


func _ready() -> void:
	# Code to run in Dev mode
#	print(Engine.is_editor_hint())
#	if Engine.is_editor_hint():
#
#		OS.set_window_fullscreen(false)
#		return
	self._initialize_signals()
	
	# Argument "connected" isn't used but is required
	self.detect_joypad_type(0, false)
		
	OS.set_window_fullscreen(false)
	TranslationServer.set_locale(OS.get_locale())
	


# ----------------- DECLARE FUNCTIONS -----------------


func _initialize_signals() -> void:
	Input.connect("joy_connection_changed", self, "on_joy_connection_changed")




var joypad_names_xbox: PoolStringArray = ["xbox"]
var joypad_names_playstation: PoolStringArray = ["playstation", "dualshock"]
var joypad_names_nintendo_switch: PoolStringArray = ["switch"]


func on_joy_connection_changed(device: int, connected: bool) -> void:
	print("Gamepad #", device, " | Connected: ", connected)
	self.detect_joypad_type(device, connected)


func detect_joypad_type(device: int, _connected: bool) -> void:
	device = 0
	
	var _connected_joypad_name: String = Input.get_joy_name(device).to_lower()
	print(self.name, ": Joypad connection changed!")
	
	if Input.get_connected_joypads() == []:
		# PC Keyboard mouse
		print(self.name, ": No controller is connected")
		joypad_type = JoypadTypes.NONE
		self.emit_signal("joypad_type_detected")
		return

	
	# Controllers
	for joypad_name in joypad_names_xbox:
		if joypad_name in _connected_joypad_name:
			print(self.name, ": Xbox controller connected")
			joypad_type = JoypadTypes.XBOX
			self.emit_signal("joypad_type_detected")
			return
	
	for joypad_name in joypad_names_playstation:
		if joypad_name in _connected_joypad_name:
			print(self.name, ": Playstation controller connected")
			joypad_type = JoypadTypes.PLAYSTATION
			self.emit_signal("joypad_type_detected")
			return
	
	for joypad_name in joypad_names_nintendo_switch:
		if joypad_name in _connected_joypad_name:
			print(self.name, ": Nintendo Switch controller connected")
			joypad_type = JoypadTypes.NINTENDO_SWITCH
			self.emit_signal("joypad_type_detected")
			return
	
	# Unkown joypad type
	print(self.name, ": Unkown controller connected")
	joypad_type = JoypadTypes.UNKOWN
	self.emit_signal("joypad_type_detected")
