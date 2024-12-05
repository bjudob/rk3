extends Itemable


func _on_item_correct(item):
	$CPUParticles2D.visible = true
	$"../HavasJani"._on_saboteur()
