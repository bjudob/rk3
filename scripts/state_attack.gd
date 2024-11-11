class_name StateAttack
extends State

var player: CharacterBody2D
var this: CharacterBody2D
var animator: AnimationPlayer

var attack_distance: float = 50
var ranged = false

@onready var main = get_tree().get_nodes_in_group("main")[0]
@onready var bullet = load("res://scenes/bullet.tscn")

func enter() -> void:
	pass

func exit() -> void:
	pass
	
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	var direction = player.global_position - this.global_position
	if direction.length() < attack_distance:
		this.velocity = Vector2(0,0)
		animator.play("attack")
		if ranged:
			var new_bullet = bullet.instantiate()
			main.add_child.call_deferred(new_bullet)
	else:
		this.velocity = Vector2()
		StateTransition.emit(self, Enemy.StateEnum.FOLLOW)
