extends CharacterBody2D

var speed = 400
var spawn_pos = Vector2(0,0)
var direction = Vector2(1,0)

func _ready() -> void:
	global_position = spawn_pos

func _physics_process(delta: float) -> void:
	velocity = Vector2(0, -speed)
	move_and_slide()
