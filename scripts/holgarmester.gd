extends NPC


func _on_item_correct(item):
	if item.id == "santa_zsak":
		current_dialog = "holgarmester_igy_jo"
		Dialogic.start(current_dialog)
		game_ui.hide_tooltip()
