extends NPC


func _on_item_correct(item):
	if item.id == "miku_head":
		main.add_event(Main.GameEvents.MIKU_HEAD)
		item_needed = "cica_head"
		current_dialog = "aztec_miku"
		Dialogic.start(current_dialog)
		game_ui.hide_tooltip()
