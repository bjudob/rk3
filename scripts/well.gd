class_name Well
extends Itemable

@export var location: int = 1

func _on_item_correct(item):
	item_needed = "nothing"
	if location == 1:
		inventory.add_item($ItemCloud)
	if location == 2:
		inventory.add_item($ItemWater)
	if location == 3:
		inventory.add_item($ItemLava)
