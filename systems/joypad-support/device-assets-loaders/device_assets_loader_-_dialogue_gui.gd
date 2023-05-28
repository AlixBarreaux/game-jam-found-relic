extends DeviceAssetsLoader
class_name DeviceAssetsLoaderDialogueGUI


# ----------------- DECLARE VARIABLES -----------------


export var skip_icon_node_path: NodePath = NodePath("")


onready var skip_icon: TextureRect = get_node(skip_icon_node_path)


# ---------------------- RUN CODE ---------------------


func _set_assets_from_resource(resource: Resource) -> void:
	skip_icon.texture = resource.skip_icon_texture


# ----------------- DECLARE FUNCTIONS -----------------
