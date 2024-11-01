class_name Inventory
extends MarginContainer

var items = []
var items_slots = [
	
]

func _ready() -> void:
	pass

func add_item(item: Item):
	items.append(item)
	refresh_ui()

func refresh_ui():
	pass
