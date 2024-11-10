class_name StateFollow
extends State

@export
var this: CharacterBody2D

@export
var move_speed: float = 100
@export
var follow_distance: float = 500

@onready
var player = get_tree().get_nodes_in_group("player")[0]  

func enter() -> void:
	pass

func exit() -> void:
	pass
	
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	var direction = player.global_position - this.global_position
	if direction.length() < 50:
		StateTransition.emit(self, "DevilAttack")
	elif direction.length() < follow_distance:
		this.velocity = direction.normalized() * move_speed
	else:
		this.velocity = Vector2()
		StateTransition.emit(self, "DevilIdle")
