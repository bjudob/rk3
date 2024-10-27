class_name Enemy
extends RigidBody2D

@export
var max_hp = 100
@export
var animator:AnimationPlayer
var current_hp = max_hp

signal health_changed

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if current_hp < 0:
		self.queue_free()
		health_changed.emit()

func take_damage(dmg: int):
	current_hp -= dmg
	animator.play("hurt")
	health_changed.emit()
	# also play sound
