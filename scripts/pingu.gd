extends NPC

@export var animation_player: AnimationPlayer

func _on_item_correct(item):
	animation_player.play("pingu_szanko")
