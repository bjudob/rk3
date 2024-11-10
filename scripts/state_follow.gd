class_name StateFollow
extends State

var player: CharacterBody2D
var this: CharacterBody2D
var animator: AnimationPlayer

var move_speed: float = 100
var follow_distance: float = 500


func enter() -> void:
	pass

func exit() -> void:
	pass
	
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	var direction = player.global_position - this.global_position
	if direction.length() < 50:
		StateTransition.emit(self, Enemy.StateEnum.ATTACK)
	elif direction.length() < follow_distance:
		this.velocity = direction.normalized() * move_speed
	else:
		this.velocity = Vector2()
		StateTransition.emit(self, Enemy.StateEnum.IDLE)
