extends Node2D

@onready var game_ui = get_tree().get_nodes_in_group("game_ui")[0]
@onready var gargoyle_den = $GargoyleDen
@onready var imp_hut = $ImpHut

var gargoyle_den_built = false
var imp_hut_built = false

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if not gargoyle_den_built and Dialogic.VAR.hell_buildings.gargoyle_den.is_built:
		gargoyle_den.visible = true
		gargoyle_den_built = true
		print(-Dialogic.VAR.hell_buildings.gargoyle_den.cost)
		game_ui.add_souls(-Dialogic.VAR.hell_buildings.gargoyle_den.cost, false)
		
	if not imp_hut_built and Dialogic.VAR.hell_buildings.imp_hut.is_built:
		imp_hut.visible = true
		imp_hut_built = true
		game_ui.add_souls(-Dialogic.VAR.hell_buildings.imp_hut.cost, false)
