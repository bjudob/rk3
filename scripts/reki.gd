class_name Reki
extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -900.0
var facing_right = true

@onready
var animation = $AnimationPlayer

func play_animation(name):
	if animation.current_animation != "attack_sword":
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
		$RekiSprites.scale.x = $RekiSprites.scale.x * -1
	elif  direction > 0  and facing_right == false:
		facing_right = true
		$RekiSprites.scale.x = $RekiSprites.scale.x * -1
		
	if Input.is_action_just_pressed("attack"):
		play_animation("attack_sword")
	
	move_and_slide()


func _on_hit_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("hurtbox"):
		area.take_damage()
