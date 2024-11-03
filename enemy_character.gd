class_name EnemyCharacter
extends CharacterBody2D

@export var max_hp = 100
@export var souls = 50
@export var is_demon = true
@export var animator:AnimationPlayer
var current_hp = max_hp

@onready var game_ui = get_tree().get_nodes_in_group("game_ui")[0]

signal health_changed

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if current_hp < 0:
		die()
		

func take_damage(dmg: int):
	current_hp -= dmg
	animator.play("hurt")
	health_changed.emit()
	# also play sound

func die():
	self.queue_free()
	health_changed.emit()
	game_ui.add_souls(souls, is_demon)
