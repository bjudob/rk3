extends NPC

@export var animation_player: AnimationPlayer

func _on_item_correct(item):
	if animation_player:
		animation_player.play("pingu_szanko")
