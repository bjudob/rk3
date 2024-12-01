extends NPC

func _on_item_correct(item):
	if item.id == "karacsonyi_tojas":
		current_dialog = "nyuszi_tojas_found"
		item_needed = "carrot_cake"
		Dialogic.start(current_dialog)
		game_ui.hide_tooltip()
	if item.id == "carrot_cake":
		current_dialog = "nyuszi_nyami"
		Dialogic.start(current_dialog)
		game_ui.hide_tooltip()
		main.add_event(Main.GameEvents.GIFTED_NYUSZI)
