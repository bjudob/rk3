class_name StateAttack
extends State

var player: CharacterBody2D
var this: CharacterBody2D
var animator: AnimationPlayer

var move_speed: float = 100
var attack_distance: float = 50

func enter() -> void:
	pass

func exit() -> void:
	pass
	
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	var direction = player.global_position - this.global_position
	if direction.length() < attack_distance:
		animator.play("attack")
	else:
		this.velocity = Vector2()
		StateTransition.emit(self, Enemy.StateEnum.FOLLOW)
