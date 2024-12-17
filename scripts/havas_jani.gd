extends NPC

@onready var hoember_beteg = load("res://characters/hoember_beteg.png")
@onready var original_texture = $HavasJani.texture

func _process(delta: float) -> void:
	super._process(delta)
	if main.event_happened(Main.GameEvents.HOEMBER_BETEG):
		$HavasJani.texture = hoember_beteg
		current_dialog = "hoember_beteg"
		item_needed = "adrenaline"
		Dialogic.start(current_dialog)
		game_ui.hide_tooltip()
		
func _on_item_correct(item):
	if item.id == "adrenaline":
		$HavasJani.texture = original_texture
		current_dialog = "hoember_gyogyul"
		Dialogic.start(current_dialog)
		game_ui.hide_tooltip()

func _on_saboteur():
	current_dialog = "havas_jani_sabot"
	Dialogic.start(current_dialog)
	game_ui.hide_tooltip()
	main.add_event(Main.GameEvents.SABOTATED)
