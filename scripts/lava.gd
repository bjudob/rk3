extends Itemable


# Called when the node enters the scene tree for the first time.
func _on_item_correct(item):
	inventory.add_item($"../ItemSultChicken")
