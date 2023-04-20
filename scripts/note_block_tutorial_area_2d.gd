class_name NoteBlockTutorialArea2D
extends Area2D


# ----------------- DECLARE VARIABLES -----------------


onready var tutorial_sprite: Node2D = $TutorialSprite


# ----------------- RUN CODE -----------------


func _ready() -> void:
	tutorial_sprite.hide()


# ----------------- DECLARE FUNCTIONS -----------------


func _on_NoteBlockTutorialArea2D_body_entered(_body: PhysicsBody2D) -> void:
	tutorial_sprite.show()


func _on_NoteBlockTutorialArea2D_body_exited(_body: PhysicsBody2D) -> void:
	tutorial_sprite.hide()


func _on_NoteBlock_interactable_enabled(signal_args: Dictionary) -> void:
	get_tree().call_group("note_block_switch_characters_tutorial", "queue_free")
