extends NPC


func _on_item_correct(item):
	pass

func _on_saboteur():
	current_dialog = "havas_jani_sabot"
	Dialogic.start(current_dialog)
	game_ui.hide_tooltip()
	main.add_event(Main.GameEvents.SABOTATED)
