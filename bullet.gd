extends CharacterBody2D

var speed = 400
var spawn_pos = Vector2(0,0)
var direction = Vector2(1,0)
var bullet_texture = load("res://objects/snowball.png")

@onready
var lifetimer = $Lifetimer

func _ready() -> void:
	global_position = spawn_pos
	$Sprite2D.texture = bullet_texture
	lifetimer.start()
	lifetimer.connect("timeout", _destroy)

func _physics_process(delta: float) -> void:
	velocity = direction * speed
	move_and_slide()

func _destroy():
	self.queue_free()
