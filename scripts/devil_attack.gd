class_name DevilAttack
extends State

@export
var devil: CharacterBody2D
@export
var move_speed: float = 100
@export
var attack_distance: float = 50

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
	if direction.length() < attack_distance:
		$"../../AnimationPlayer".play("attack")
	else:
		devil.velocity = Vector2()
		StateTransition.emit(self, "DevilFollow")
