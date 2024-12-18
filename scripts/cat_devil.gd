extends NPC

@export var anim: AnimationPlayer

func _process(delta: float) -> void:
	super._process(delta)
	if main.event_happened(Main.GameEvents.MIKU_HEAD):
		current_dialog = "cica_head"
		Dialogic.start(current_dialog)
		game_ui.hide_tooltip()
		$ItemCicaHead.visible = true
		
		
func _on_item_correct(item):
	if item.id == "miku_cipo":
		current_dialog = "cica_something"
		Dialogic.start(current_dialog)
		game_ui.hide_tooltip()
		item_needed = "miku_szakall"
	if item.id == "miku_szakall":
		item_needed = "pisi"
	if item.id == "pisi":
		item_needed = "nail"
	if item.id == "nail":
		anim.play("ritual")
		
func _on_ritual_ended():
	item_needed = "cica_killer"
	current_dialog = "cica_ritual"
	Dialogic.start(current_dialog)
	game_ui.hide_tooltip()
	main.add_event(Main.GameEvents.RITUAL)
