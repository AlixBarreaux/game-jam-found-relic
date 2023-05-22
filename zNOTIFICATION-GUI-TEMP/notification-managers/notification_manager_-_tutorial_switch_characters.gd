extends NotificationManager
class_name NotificationManagerSwitchCharacters


# ----------------- DECLARE VARIABLES -----------------


export var switch_characters_area2d_node_node_path: NodePath = NodePath("")

onready var switch_characters_area2d_node: Area2D = get_node(switch_characters_area2d_node_node_path)


# ---------------------- RUN CODE ---------------------



# ---------------------- RUN CODE ---------------------



# ----------------- DECLARE FUNCTIONS -----------------


func _custom_on_ready() -> void:
	if Events.connect("controlled_hero_switched", self, "on_controlled_hero_switched") != OK:
		printerr("(!) ERROR: In " + self.name + ": Connection to signal 'controlled_hero_switched' error.")
	
	switch_characters_area2d_node.connect("area_entered", self, "on_switch_characters_area2d_entered")


func on_controlled_hero_switched() -> void:
	self.send_notification_deletion()
	
	if is_instance_valid(switch_characters_area2d_node):
		switch_characters_area2d_node.queue_free()
	
	self.queue_free()


func on_switch_characters_area2d_entered(area: Area2D) -> void:
	self.send_notification_data(data_index)
