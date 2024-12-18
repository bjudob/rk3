extends NPC


func _on_item_correct(item):
	if item.id == "santa_zsak":
		item_needed = "gold_bag"
		current_dialog = "holgarmester_igy_jo"
		Dialogic.start(current_dialog)
		game_ui.hide_tooltip()
	if item.id == "gold_bag":
		current_dialog = "holgarmester_penz"
		Dialogic.start(current_dialog)
		game_ui.hide_tooltip()
		inventory.add_item($ItemBranch)
		$"../Maci".on_holgarmester()
