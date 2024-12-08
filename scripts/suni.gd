extends NPC

func _on_item_correct(item):
	current_dialog = "suni_koszonom"
	Dialogic.start(current_dialog)
	game_ui.hide_tooltip()
