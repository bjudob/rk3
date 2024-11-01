class_name GameUI
extends CanvasLayer

@export var reki: Reki
@export var game_ui: GameUI
@export var main: Main

@onready var tooltip = $Tooltip
@onready var inventory = $Inventory

func _ready() -> void:
	pass

func show_tooltip(text: String):
	tooltip.show_tooltip(text)

func hide_tooltip():
	tooltip.hide_tooltip()

func add_item(item: Item):
	inventory.add_item(item)
