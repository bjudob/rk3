class_name DevilIdle
extends State

@export
var devil: CharacterBody2D
@export
var move_speed: float = 10

var move_direction: Vector2
var move_time: float

func randomize_movement():
	move_direction = Vector2(randf_range(-1,1), randf_range(-1,1)).normalized()
	move_time = randf_range(1,2)

func _enter() -> void:
	randomize_movement()

func _process(delta: float) -> void:
	if move_time > 0:
		move_time -= delta
	else:
		randomize_movement()
	
func _physics_process(delta: float) -> void:
	devil.velocity = move_direction*move_speed
	
