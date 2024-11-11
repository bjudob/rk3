class_name Reki
extends HP

var hp_regen = 10
const SPEED = 500.0
const JUMP_VELOCITY = -900.0
var facing_right = true

@onready var hp_regen_timer = $HpRegenTimer
@onready var animation = $AnimationPlayer

func _ready() -> void:
	hp_regen_timer.connect("timeout", _regen_hp)
	hp_regen_timer.start()
	

func play_animation(name):
	if animation.current_animation != "attack_sword" and animation.current_animation != "hurt":
		animation.play(name)

func _physics_process(delta: float) -> void:
	var is_jumping = not is_on_floor()
	if is_jumping:
		velocity += get_gravity() * delta
		play_animation("Jump")
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		if not is_jumping:
			play_animation("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if not is_jumping:
			play_animation("Idle")
			
	if direction < 0 and facing_right == true:
		facing_right = false
		scale.x = scale.x * -1
	elif  direction > 0  and facing_right == false:
		facing_right = true
		scale.x = scale.x * -1
		
	if Input.is_action_just_pressed("attack"):
		play_animation("attack_sword")
	
	move_and_slide()

func _regen_hp():
	var regened_hp = current_hp + hp_regen
	if regened_hp > max_hp:
		regened_hp = max_hp
	current_hp = regened_hp
	health_changed.emit()
	hp_regen_timer.start()
