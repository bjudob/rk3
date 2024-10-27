class_name DevilFollow
extends State

@export
var devil: CharacterBody2D
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
	var direction = player.global_position - devil.global_position
	if direction.length() < follow_distance:
		devil.velocity = direction.normalized() * move_speed
	else:
		devil.velocity = Vector2()
		StateTransition.emit(self, "DevilIdle")
