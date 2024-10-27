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

func _enter() -> void:
	pass

func _exit() -> void:
	pass
	
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	var direction = player.global_position - devil.global_position
	if direction.length() < follow_distance:
		devil.velocity = direction.normalized() * move_speed
	else:
		devil.velocity = Vector2()
		StateTransition.emit(self, "DevilIdle")
