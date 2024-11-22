class_name HurtBox
extends Area2D

@export var coll_layer = 0
@export var coll_mask = 2

func _ready() -> void:
	collision_layer = coll_layer
	collision_mask = coll_mask
	connect("area_entered", self._on_area_entered)

func _on_area_entered(hitbox: HitBox):
	if not hitbox:
		return
	owner.take_damage(hitbox.dmg)
