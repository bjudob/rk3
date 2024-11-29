extends NPC

func _on_item_correct(item):
	current_dialog = "nyuszi_tojas_found"
	Dialogic.start(current_dialog)
	game_ui.hide_tooltip()
