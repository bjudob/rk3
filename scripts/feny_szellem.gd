extends NPC


func _on_item_correct(item):
	current_dialog = "feny_szellem_penz"
	Dialogic.start(current_dialog)
	game_ui.hide_tooltip()
	inventory.add_item($ItemGoldbag)
