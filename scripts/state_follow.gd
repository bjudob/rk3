class_name StateFollow
extends State

var player: CharacterBody2D
var this: CharacterBody2D
var animator: AnimationPlayer

var follow_move_speed: float = 100
var follow_distance: float = 500
var attack_distance: float = 50
var grounded: bool = false

func enter() -> void:
	animator.play("follow")

func exit() -> void:
	pass
	
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	var direction = player.global_position - this.global_position
	if direction.length() < attack_distance:
		StateTransition.emit(self, Enemy.StateEnum.ATTACK)
	elif direction.length() < follow_distance:
		this.velocity = direction.normalized() * follow_move_speed
	else:
		this.velocity = Vector2()
		StateTransition.emit(self, Enemy.StateEnum.IDLE)
	if grounded:
		this.velocity = Vector2(this.velocity.x, 0)
