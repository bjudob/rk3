extends Node2D

@onready var gargoyle_den = $GargoyleDen
var gargoyle_den_build = false
var gargoyle_den_cost = false

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if gargoyle_den_build and Dialogic.VAR.hell_buildings.gargoyle_den:
		gargoyle_den.visible = true
		
