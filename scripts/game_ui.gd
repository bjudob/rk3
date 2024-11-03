class_name GameUI
extends CanvasLayer

@export var reki: Reki
@export var game_ui: GameUI
@export var main: Main

@onready var tooltip = $Tooltip
@onready var inventory = $Inventory
@onready var demon_souls_display = $DemonSouls/HBoxContainer/MarginContainer2/Label
@onready var angel_souls_display = $AngelSouls/HBoxContainer/MarginContainer2/Label

var demon_souls = 0
var angel_souls = 0

func _ready() -> void:
	demon_souls_display.text = str(demon_souls)
	angel_souls_display.text = str(angel_souls)

func show_tooltip(text: String):
	tooltip.show_tooltip(text)

func hide_tooltip():
	tooltip.hide_tooltip()

func add_item(item: Item):
	inventory.add_item(item)
	
func add_souls(nr: int, is_demon: bool):
	if is_demon:
		demon_souls+=nr
		demon_souls_display.text = str(demon_souls)
	else:
		angel_souls+=nr
		angel_souls_display.text = str(angel_souls)
