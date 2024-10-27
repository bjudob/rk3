class_name DevilIdle
extends State

@export
var devil: CharacterBody2D
@export
var move_speed: float = 10

@onready
var player = get_tree().get_nodes_in_group("player")[0]  

var move_direction: Vector2
var move_time: float
var follow_distance: float = 500

func randomize_movement():
	move_direction = Vector2(randf_range(-1,1), randf_range(-1,1)).normalized()
	move_time = randf_range(1,2)

func enter() -> void:
	randomize_movement()

func update(delta: float) -> void:
	if move_time > 0:
		move_time -= delta
	else:
		randomize_movement()
	var direction = player.global_position - devil.global_position
	if direction.length() < follow_distance:
		StateTransition.emit(self, "DevilFollow")
	
func physics_update(delta: float) -> void:
	devil.velocity = move_direction * move_speed
	
