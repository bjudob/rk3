class_name HitBox
extends Area2D

@export
var dmg = 30
@export var coll_layer = 8
@export var coll_mask = 4

func _ready() -> void:
	collision_layer = coll_layer
	coll_mask = coll_mask
	var coll_shape = get_child(0)
	coll_shape.disabled = true
	
