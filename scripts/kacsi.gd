extends NPC


var kacsa_bought = false
var adrenaline_bought = true

func _process(delta: float) -> void:
	super._process(delta)
	if main.event_happened(Main.GameEvents.KACSA_ADRENALIN):
		adrenaline_bought = false
		Dialogic.VAR.kacsa_items.adrenaline.bought = false
		
	if not kacsa_bought and Dialogic.VAR.kacsa_items.kacsa.bought:
		inventory.add_item($ItemKacsa)
		kacsa_bought = true
		game_ui.add_ducks(-Dialogic.VAR.kacsa_items.kacsa.cost)
	if not adrenaline_bought and Dialogic.VAR.kacsa_items.adrenaline.bought:
		inventory.add_item($ItemAdrenaline)
		adrenaline_bought = true
