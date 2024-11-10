class_name HealthBar
extends ProgressBar

@onready
var timer = $Timer
@onready
var damage_bar = $DamageBar
var character: HP

func _ready() -> void:
	print(owner)
	if owner is HP:
		character = owner
		character.health_changed.connect(update_health_bar)
	value = 100

func update_health_bar():
	timer.start()
	value = character.current_hp * 100 / character.max_hp


func _on_timer_timeout() -> void:
	damage_bar.value = character.current_hp * 100 / character.max_hp
