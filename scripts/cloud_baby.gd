extends Itemable


func _on_item_correct(item):
	$AnimationPlayer.play("plusi")

func _on_plusi():
	inventory.add_item($ItemBabyCloud)
	visible = false
	$CollisionShape2D.disabled = true
