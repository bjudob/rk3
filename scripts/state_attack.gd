class_name StateAttack
extends State

var attack_speed_timer: Timer
var player: CharacterBody2D
var this: CharacterBody2D
var animator: AnimationPlayer

var attack_distance: float = 50
var ranged = false
var can_attack = true
@onready
var bullet = load("res://scenes/snowball.tscn")
var bullet_texture
var ranged_dmg

@onready var main = get_tree().get_nodes_in_group("main")[0]

func enter() -> void:
	if not attack_speed_timer.is_connected("timeout", _attack_speed_timeout):
		attack_speed_timer.connect("timeout", _attack_speed_timeout)

func exit() -> void:
	pass
	
func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	var distance = player.global_position - this.global_position
	if distance.length() < attack_distance:
		_attack()
	else:
		this.velocity = Vector2()
		if animator.current_animation != "attack":
			StateTransition.emit(self, Enemy.StateEnum.FOLLOW)

func _attack():
	if not can_attack:
		return
	can_attack = false
	attack_speed_timer.start()
	this.velocity = Vector2(0,0)
	animator.play("attack")
	if ranged:
		_ranged_attack()
		
func _ranged_attack():
	var direction = this.global_position.direction_to(player.global_position)
	var new_bullet = bullet.instantiate()
	new_bullet.bullet_texture = bullet_texture
	new_bullet.direction = direction
	new_bullet.spawn_pos = this.global_position
	new_bullet.ranged_dmg = ranged_dmg
	main.add_child.call_deferred(new_bullet)

func _attack_speed_timeout():
	can_attack = true
