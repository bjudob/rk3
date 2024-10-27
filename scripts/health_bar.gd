class_name HealthBar
extends ProgressBar

@onready
var timer = $Timer
@onready
var damage_bar = $DamageBar
var enemy: EnemyCharacter

func _ready() -> void:
	if owner is EnemyCharacter:
		enemy = owner
		enemy.health_changed.connect(update_health_bar)
	update_health_bar()

func update_health_bar():
	timer.start()
	value = enemy.current_hp * 100 / enemy.max_hp


func _on_timer_timeout() -> void:
	damage_bar.value = enemy.current_hp * 100 / enemy.max_hp
