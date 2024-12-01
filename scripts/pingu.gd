extends NPC

@export var animation_player: AnimationPlayer

func _on_item_correct(item):
	if item.id == "gift_pingu":
		current_dialog = "pingu_eltunt_barat"
		Dialogic.start(current_dialog)
		item_needed = "szanko"
		main.add_event(Main.GameEvents.GIFTED_PINGU)
		return
	if animation_player:
		animation_player.play("pingu_szanko")
