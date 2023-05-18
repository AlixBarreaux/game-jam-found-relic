extends DeviceAssetsLoader
class_name DeviceAssetsLoaderNotificationGUI


# ----------------- DECLARE VARIABLES -----------------


export var key_icon_node_path: NodePath = NodePath("")
export var label_node_path: NodePath = NodePath("")


onready var key_icon: TextureRect = get_node(key_icon_node_path)
onready var label: Label = get_node(label_node_path)


# ---------------------- RUN CODE ---------------------


func _set_assets_from_resource(resource: Resource) -> void:
	key_icon.texture = resource.key_icon_texture
	label.text = resource.label_text


# ----------------- DECLARE FUNCTIONS -----------------
