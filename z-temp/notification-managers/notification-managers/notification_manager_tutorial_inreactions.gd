extends NotificationManager
class_name NotificationManagerTutorialInteractions


# ----------------- DECLARE VARIABLES -----------------


#export var hero_man_node_node_path: NodePath = NodePath("")
#export var hero_woman_node_node_path: NodePath = NodePath("")
#
#
#onready var hero_man_node: Hero = get_node(self.hero_man_node_node_path)
#onready var hero_woman_node: Hero = get_node(self.hero_woman_node_node_path)
#
#onready var timer: Timer = $Timer


# ---------------------- RUN CODE ---------------------


func _ready():
	print(self.name, ": PLEASE IMPLEMENT ME!")

#func _ready() -> void:
#	self._initialize_asserts()
#
#
#func _physics_process(delta: float) -> void:
#	if hero_man_node.velocity != Vector2(0.0, 0.0):
#		self.send_notification_deletion()
#		self.queue_free()
#	elif hero_woman_node.velocity != Vector2(0.0, 0.0):
#		self.send_notification_deletion()
#		self.queue_free()


# ----------------- DECLARE FUNCTIONS -----------------


#func _initialize_asserts() -> void:
#	assert(hero_man_node != hero_woman_node)
#
#
#func _custom_on_ready() -> void:
#	timer.connect("timeout", self, "on_timer_timeout")
#
#
#func on_timer_timeout():
#	self.send_notification_data(data_index)
