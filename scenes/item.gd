extends Node2D

@export var id = "fire"
@export var image = "res://objects/fire.png"
@onready var default_cursor = load("res://ui/cursor_dudu.png")
@onready var pickup_cursor = load("res://ui/cursor_mochi.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(pickup_cursor)


func _on_area_2d_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(default_cursor)
