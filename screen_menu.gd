extends Control
class_name ScreenMenu


# ----------------- DECLARE VARIABLES -----------------

# Node Paths
export (NodePath) var first_button_to_focus_node_path = null

onready var first_button_to_focus: Button = get_node(first_button_to_focus_node_path)

# ---------------------- RUN CODE ---------------------

# ----------------- DECLARE FUNCTIONS -----------------
