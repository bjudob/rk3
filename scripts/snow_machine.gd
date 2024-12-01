extends Itemable

var unlocked = false

func _ready() -> void:
	super._ready()
	$Timer.connect("timeout", _on_timer_ends)

func _on_item_correct(item):
	unlocked = true
	$CPUParticles2D.visible = true
	$AudioStreamPlayer2D.play()
	$Timer.start()

func _on_timer_ends():
	$"../SnowWall".visible = false
	$"../SnowWall/CollisionShape2D".disabled = true
