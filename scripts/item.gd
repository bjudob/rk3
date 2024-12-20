@tool
class_name Item
extends Node2D

@export var id = "duck"
@export var image = load("res://objects/duck.png")
@export var destroy_on_use = true

@onready var default_cursor = load("res://ui/cursor_dudu.png")
@onready var pickup_cursor = load("res://ui/cursor_mochi.png")

@onready var sprite = $Sprite2D

func _ready() -> void:
	sprite.texture = image

func _on_area_2d_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(pickup_cursor)

func _on_area_2d_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(default_cursor)

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
		owner.game_ui.add_item(self)
		Input.set_custom_mouse_cursor(default_cursor)
		get_parent().remove_child(self)
