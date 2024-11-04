extends NPC

func _on_item_correct(item):
	if item.id == "fire":
		$Flames.visible = true
