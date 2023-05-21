extends DeviceAssetsLoader
class_name DeviceAssetsLoaderNotificationGUI


# ----------------- DECLARE VARIABLES -----------------


#export var key_icon_node_path: NodePath = NodePath("")
#export var label_node_path: NodePath = NodePath("")


#onready var key_icon: TextureRect = get_node(key_icon_node_path)
#onready var label: Label = get_node(label_node_path)


# ---------------------- RUN CODE ---------------------


# Load assets actions list by platform
func _set_assets_from_resource(resource: Resource) -> void:
	print(self.name, " _set_assets_from_resource: Resource:", resource)
	
	print(self.name, " data_list_from_platform BEFORE CHANGE: ", node_to_work_on.data_list_from_platform)
	node_to_work_on.data_list_from_platform = resource
	print(self.name, " data_list_from_platform AFTER CHANGE: ", node_to_work_on.data_list_from_platform)
	
#	node_to_work_on.load_data_at_index(node_to_work_on.current_index_in_data_set)

	node_to_work_on.set_data_list_from_platform(resource)


# ----------------- DECLARE FUNCTIONS -----------------
