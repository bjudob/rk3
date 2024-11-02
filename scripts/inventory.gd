class_name Inventory
extends MarginContainer

var items = []
var item_slots = []
var selected_item = null

func _ready() -> void:
	_load_item_slots()
	
func _load_item_slots():
	item_slots = []
	for item_slot in $ItemsSlots.get_children():
		item_slots.append(item_slot)

func add_item(item: Item):
	items.append(item)
	refresh_ui()

func select_item(item_slot: ItemSlot, item: Item):
	selected_item = item
	item_slot.select_item()
	for slot in item_slots:
		if slot != item_slot:
			slot.deselect_item()
	
func deselect_item(item_slot: ItemSlot, item: Item):
	selected_item = null
	item_slot.deselect_item()

func refresh_ui():
	var i = 0
	for item_slot in item_slots:
		var item = null
		if i < items.size():
			item = items[i]
		item_slot.set_item(item)
		i+=1
