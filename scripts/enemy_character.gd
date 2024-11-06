class_name EnemyCharacter
extends HP

@export var souls = 50
@export var is_demon = true

func _die():
	self.queue_free()
	health_changed.emit()
	game_ui.add_souls(souls, is_demon)
