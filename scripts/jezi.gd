extends NPC


func _on_item_correct(item):
	if item.id == "water":
		$Jezi.visible = false
		$JeziDrunk.visible = true
		$Wine.visible = true
		$WineUveg.visible = true
