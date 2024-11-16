class_name GameUI
extends CanvasLayer

@export var reki: Reki
@export var game_ui: GameUI
@export var main: Main

@onready var tooltip = $Tooltip
@onready var inventory = $Inventory
@onready var demon_souls_display = $DemonSouls/HBoxContainer/MarginContainer2/Label
@onready var angel_souls_display = $AngelSouls/HBoxContainer/MarginContainer2/Label
@onready var ducks_label = $Ducks/HBoxContainer/MarginContainer/DuckNr

var demon_souls = 240
var angel_souls = 250
var ducks = 0

func _ready() -> void:
	demon_souls_display.text = str(demon_souls)
	angel_souls_display.text = str(angel_souls)
	ducks_label.text = str(ducks)

func  _process(delta: float) -> void:
	Dialogic.VAR.hell_buildings.money = angel_souls

func show_tooltip(text: String):
	tooltip.show_tooltip(text)

func hide_tooltip():
	tooltip.hide_tooltip()

func add_item(item: Item):
	if item.id == "duck":
		ducks += 1
		ducks_label.text = str(ducks)
		return
	inventory.add_item(item)
	
func add_souls(nr: int, is_demon: bool):
	print("add souls called with")
	print(nr)
	if is_demon:
		demon_souls+=nr
		demon_souls_display.text = str(demon_souls)
	else:
		angel_souls+=nr
		angel_souls_display.text = str(angel_souls)
