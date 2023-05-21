extends DeviceAssetsLoader
class_name DeviceAssetsLoaderNotificationGUI


# ----------------- DECLARE VARIABLES -----------------



# ---------------------- RUN CODE ---------------------


# Load assets actions list by platform
func _set_assets_from_resource(resource: Resource) -> void:
	node_to_work_on.data_list_from_platform = resource

	self.set_data_list_from_platform(resource)


func set_data_list_from_platform(resource: Resource) -> void:
	node_to_work_on.data_list_from_platform = resource
	node_to_work_on.notifications_list = node_to_work_on.data_list_from_platform.notifications_list

	node_to_work_on.load_data_at_index(node_to_work_on.current_index_in_data_set)


# ----------------- DECLARE FUNCTIONS -----------------
