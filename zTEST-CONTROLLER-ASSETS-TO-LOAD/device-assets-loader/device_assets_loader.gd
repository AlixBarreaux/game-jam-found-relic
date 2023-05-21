extends Node
class_name DeviceAssetsLoader


# ----------------- DECLARE VARIABLES -----------------


export var node_to_work_on_node_path: NodePath = NodePath("")

onready var node_to_work_on: Node = get_node(node_to_work_on_node_path)


# Device Assets
export var assets_to_load_pc: Resource = null
export var assets_to_load_xbox: Resource = null
export var assets_to_load_playstation: Resource = null
export var assets_to_load_nintendo_switch: Resource = null



#onready var skip_icon: TextureRect = $NinePatchRect/SkipIcon


# ---------------------- RUN CODE ---------------------


func _ready() -> void:
	self._initialize_asserts()
	self._initialize_signals()


func on_node_to_work_on_ready() -> void:
	self.set_assets_adapted_to_joypad_type()
	

func _initialize_signals() -> void:
	Settings.connect("joypad_type_detected", self, "on_joypad_type_detected")
	node_to_work_on.connect("ready", self, "on_node_to_work_on_ready")


func on_joypad_type_detected() -> void:
	self.set_assets_adapted_to_joypad_type()


func set_assets_adapted_to_joypad_type() -> void:
	match(Settings.joypad_type):
		Settings.JoypadTypes.NONE:
#			print(self.name, ": Keyboard / Mouse Assets")
			_set_assets_from_resource(assets_to_load_pc)
		Settings.JoypadTypes.UNKOWN:
#			print(self.name, ": Unkown joypad Assets")
			_set_assets_from_resource(assets_to_load_xbox)
		Settings.JoypadTypes.XBOX:
#			print(self.name, ": Xbox Assets")
			_set_assets_from_resource(assets_to_load_xbox)
		Settings.JoypadTypes.PLAYSTATION:
#			print(self.name, ": Playstation Assets")
			_set_assets_from_resource(assets_to_load_playstation)
		Settings.JoypadTypes.NINTENDO_SWITCH:
#			print(self.name, ": Nintendo Assets")
			_set_assets_from_resource(assets_to_load_nintendo_switch)


# Override this method to set the appropriate assets from appropriate resource
func _set_assets_from_resource(resource: Resource) -> void:
#	skip_icon.texture = resource.skip_icon_texture
	return


# ----------------- DECLARE FUNCTIONS -----------------


func _initialize_asserts () -> void:
	assert(assets_to_load_pc != null)
	assert(assets_to_load_xbox != null)
	assert(assets_to_load_playstation != null)
	assert(assets_to_load_nintendo_switch != null)
