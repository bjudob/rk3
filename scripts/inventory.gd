class_name Inventory
extends MarginContainer

var items = []
var item_slots = []
var selected_item = null

@onready var item_follow = $"../ItemFollow"

func _ready() -> void:
	_load_item_slots()
	
func _load_item_slots():
	item_slots = []
	for item_slot in $ScrollContainer/ItemsSlots.get_children():
		item_slots.append(item_slot)

func add_item(item: Item):
	items.append(item)
	refresh_ui()

func select_item(item_slot: ItemSlot, item: Item):
	if not item:
		return
	selected_item = item
	item_follow.select_item(item)
	item_slot.select_item()
	for slot in item_slots:
		if slot != item_slot:
			slot.deselect_item()
	
func deselect_item():
	selected_item = null
	item_follow.deselect_item()
	for item_slot in item_slots:
		item_slot.deselect_item()

func remove_item(item: Item):
	for item_slot in item_slots:
		item_slot.deselect_item()
	var index_to_remove = null
	for i in len(items):
		if items[i] == item:
			index_to_remove = i
	items.remove_at(index_to_remove)
	refresh_ui()
		

func refresh_ui():
	var i = 0
	for item_slot in item_slots:
		var item = null
		if i < items.size():
			item = items[i]
		item_slot.set_item(item)
		if i >= items.size() and i >= 10:
			item_slot.visible = false
		else:
			item_slot.visible = true
		i+=1
