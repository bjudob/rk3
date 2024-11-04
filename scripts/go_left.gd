extends Area2D

@onready var main = $".."
@onready var reki = $"../Reki"

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	main.change_scene(main.left_level)
	reki.position = Vector2(1940, reki.position.y)
