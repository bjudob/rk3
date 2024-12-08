extends NPC


func _on_item_correct(item):
	current_dialog = "foxi_csirke"
	Dialogic.start(current_dialog)
	game_ui.hide_tooltip()
	inventory.add_item($ItemScroll)
