extends NPC

func _ready() -> void:
	super._ready()
	$TalkArea/CollisionShape2D.disabled = true
	$ItemableArea/CollisionShape2D.disabled = true
	$ItemNail/Area2D/CollisionShape2D.disabled = true
	visible = false
	$ItemNail.visible = false

func _process(delta: float) -> void:
	super._process(delta)
	if main.event_happened(Main.GameEvents.JEZI_RESPAWN):
		visible = true
		$ItemNail.visible = true
		$TalkArea/CollisionShape2D.disabled = false
		$ItemableArea/CollisionShape2D.disabled = false
		$ItemNail/Area2D/CollisionShape2D.disabled = false
	
func _on_item_correct(item):
	pass
