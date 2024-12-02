extends NPC

func _on_item_correct(item):
	if item.id == "miku_cipo":
		current_dialog = "cica_something"
		Dialogic.start(current_dialog)
		game_ui.hide_tooltip()
