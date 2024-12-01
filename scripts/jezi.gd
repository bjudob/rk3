extends NPC


func _on_item_correct(item):
	if item.id == "water":
		$Jezi.visible = false
		$JeziDrunk.visible = true
		$Wine.visible = true
		$WineUveg.visible = true
		item_needed = "cross_branches"
		current_dialog = "jezi_keresztes"
	if item.id == "cross_branches":
		$JeziKereszten.visible = true
		$JeziDrunk.visible = false
		$Wine.visible = false
		$WineUveg.visible = false
