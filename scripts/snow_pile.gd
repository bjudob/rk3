extends Itemable

func _ready() -> void:
	super._ready()
	$"../PinguLufi/Pingu".visible = false
	$"../PinguLufi/Pingu/TalkArea/CollisionShape2D".disabled = true

func _on_item_correct(item):
	$"../PinguLufi/Pingu".visible = true
	$"../PinguLufi/Pingu/TalkArea/CollisionShape2D".disabled = false
	queue_free()
