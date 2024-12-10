extends NPC


func _on_item_correct(item):
	if item.id == "miku_head":
		main.add_event(Main.GameEvents.MIKU_HEAD)
		main.add_event(Main.GameEvents.PINGU_BETEG)
		main.add_event(Main.GameEvents.NYUSZI_BETEG)
		main.add_event(Main.GameEvents.HOEMBER_BETEG)
		item_needed = "cica_head"
		current_dialog = "aztec_miku"
		Dialogic.start(current_dialog)
		game_ui.hide_tooltip()
