class_name Foki
extends NPC

func _process(delta: float) -> void:
	super._process(delta)
	if main.event_happened(Main.GameEvents.FOKI_BETEG):
		current_dialog = "foki_pingu_beteg"
		Dialogic.start(current_dialog)
		game_ui.hide_tooltip()
		
func pingu_megvan():
	current_dialog = "foki_pingu"
	Dialogic.start(current_dialog)
	game_ui.hide_tooltip()
