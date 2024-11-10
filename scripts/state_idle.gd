class_name StateIdle
extends State

var player: CharacterBody2D
var this: CharacterBody2D
var animator: AnimationPlayer

var move_speed: float = 10
var move_direction: Vector2
var move_time: float
var follow_distance: float = 500

func randomize_movement():
	move_direction = Vector2(randf_range(-1,1), randf_range(-1,1)).normalized()
	move_time = randf_range(1,2)

func enter() -> void:
	randomize_movement()
	animator.play("idle")

func update(delta: float) -> void:
	if move_time > 0:
		move_time -= delta
	else:
		randomize_movement()
	var direction = player.global_position - this.global_position
	if direction.length() < follow_distance:
		StateTransition.emit(self, Enemy.StateEnum.FOLLOW)
	
func physics_update(delta: float) -> void:
	this.velocity = move_direction * move_speed
	
