extends NPC

@onready var maci_beteg = load("res://characters/maci_beteg.png")
@onready var original_texture = $Maci.texture

func _process(delta: float) -> void:
	super._process(delta)
	if main.event_happened(Main.GameEvents.MACI_BETEG):
		$Maci.texture = maci_beteg
		current_dialog = "maci_beteg"
		item_needed = "adrenaline"
		game_ui.hide_tooltip()
		Dialogic.start(current_dialog)

func _on_item_correct(item):
	if item.id == "adrenaline":
		$Maci.texture = original_texture
		current_dialog = "maci_beteg"
		game_ui.hide_tooltip()
		Dialogic.start(current_dialog)
		
func _on_repaired():
	current_dialog = "maci_repaired"
	main.connect("LevelTransition", _on_level_transition)
	
func _on_level_transition():
	queue_free()

func on_holgarmester():
	current_dialog = "maci_befogadva"
