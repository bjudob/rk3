class_name Inventory
extends MarginContainer

var items = []
var item_slots = []

func _ready() -> void:
	_load_item_slots()
	
func _load_item_slots():
	item_slots = []
	for item_slot in $ItemsSlots.get_children():
		item_slots.append(item_slot)

func add_item(item: Item):
	items.append(item)
	refresh_ui()

func refresh_ui():
	var i = 0
	for item_slot in item_slots:
		var item = null
		if i < items.size():
			item = items[i]
		item_slot.set_item(item)
		i+=1
