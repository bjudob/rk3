class_name Item
extends Node2D

@export var id = "fire"
@export var image = "res://objects/fire.png"
@onready var default_cursor = load("res://ui/cursor_dudu.png")
@onready var pickup_cursor = load("res://ui/cursor_mochi.png")

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_area_2d_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(pickup_cursor)

func _on_area_2d_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(default_cursor)

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
		print("clicked")
