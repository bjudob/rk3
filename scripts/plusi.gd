extends NPC


func _on_item_correct(item):
	inventory.add_item($ItemCloudBaby)
	owner.remove_child(self)
