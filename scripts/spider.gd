extends NPC

var csavarhuzo_bought = false

func _process(delta: float) -> void:
	super._process(delta)
	if not csavarhuzo_bought and Dialogic.VAR.hell_items.csavarhuzo.bought:
		inventory.add_item($ItemCsavarhuzo)
		csavarhuzo_bought = true
		game_ui.add_souls(-Dialogic.VAR.hell_items.csavarhuzo.cost, false)
