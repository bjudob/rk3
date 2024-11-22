extends Itemable

func _on_item_correct(item):
	$"../SnowWall".visible = false
	$"../SnowWall/CollisionShape2D".disabled = true
