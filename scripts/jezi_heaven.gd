extends NPC

func _ready() -> void:
	visible = false
	$TalkArea/CollisionShape2D.disabled = true
	$ItemableArea/CollisionShape2D.disabled = true
	$ItemNail.visible = false
	$ItemNail/Area2D/CollisionShape2D.disabled = true

func _process(delta: float) -> void:
	super._process(delta)
	if main.event_happened(Main.GameEvents.JEZI_RESPAWN):
		visible = true
		$TalkArea/CollisionShape2D.disabled = false
		$ItemableArea/CollisionShape2D.disabled = false
		$ItemNail.visible = true
		$ItemNail/Area2D/CollisionShape2D.disabled = false
	
func _on_item_correct(item):
	pass
