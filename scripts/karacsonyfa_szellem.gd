extends NPC

var cloud_plush_bought = false

func _process(delta: float) -> void:
	super._process(delta)
	if not cloud_plush_bought and Dialogic.VAR.heaven_items.cloud_plush.bought:
		inventory.add_item($ItemCloudPlush)
		cloud_plush_bought = true
		game_ui.add_souls(-Dialogic.VAR.heaven_items.cloud_plush.cost, true)
