extends NPC


func _process(delta: float) -> void:
	super._process(delta)
	if main.event_happened(Main.GameEvents.PISI):
		$ItemPee.visible = true
		
func _on_item_correct(item):
	inventory.add_item($ItemChalice)
	current_dialog = "felho_szellem_baby"
	Dialogic.start(current_dialog)
	game_ui.hide_tooltip()
	
