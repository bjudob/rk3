extends NPC

@onready var nyuszi_beteg = load("res://characters/nyuszi_beteg.png")
@onready var original_texture = $Nyuszi.texture

func _process(delta: float) -> void:
	super._process(delta)
	if main.event_happened(Main.GameEvents.NYUSZI_BETEG):
		$Nyuszi.texture = nyuszi_beteg
		current_dialog = "nyuszi_beteg"
		item_needed = "adrenaline"
		Dialogic.start(current_dialog)
		game_ui.hide_tooltip()
		
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
	if item.id == "adrenaline":
		$Nyuszi.texture = original_texture
		current_dialog = "nyuszi_gyogyul"
		Dialogic.start(current_dialog)
		game_ui.hide_tooltip()
