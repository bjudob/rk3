class_name Enemy
extends HP

enum StateEnum{
	IDLE,
	FOLLOW,
	ATTACK,
}

@export var attack_speed_timer: Timer
@export var souls = 50
@export var is_demon = true
@export var facing_right = true
@export var states_list: Array[StateEnum] = [StateEnum.IDLE, StateEnum.FOLLOW, StateEnum.ATTACK]

@export var idle_move_speed: float = 10
@export var follow_move_speed: float = 100
@export var follow_distance: float = 500
@export var attack_distance: float = 50
@export var ranged: bool = false
@export var ranged_dmg = 40
@export var grounded: bool = false
@export var bullet_texture =  load("res://objects/snowball.png")

const initial_state = StateEnum.IDLE
var current_state: State
var current_state_enum: StateEnum

var states_dict = {
	StateEnum.IDLE: StateIdle,
	StateEnum.FOLLOW: StateFollow,
	StateEnum.ATTACK: StateAttack,
}

var states = {}

@onready
var player = get_tree().get_nodes_in_group("player")[0]  

func _ready() -> void:
	super._ready()
	for state_enum in states_list:
		var state = states_dict[state_enum].new()
		state.this = self
		state.player = player
		state.animator = animator
		_set_optional_attrs(state)
		add_child(state)
		state.enter()
		states[state_enum] = state
		state.StateTransition.connect(_change_state)
	current_state = states[initial_state]

func _process(delta: float) -> void:
	super._process(delta)
	current_state.update(delta)

func _physics_process(delta: float) -> void:
	current_state.physics_update(delta)
	_facing()
	move_and_slide()

func _change_state(old_state, new_state_name):
	if old_state != current_state:
		return
	if current_state:
		current_state.exit()
	var new_state = states[new_state_name]
	new_state.enter()
	current_state = new_state

func _die():
	health_changed.emit()
	game_ui.add_souls(souls, is_demon)
	get_parent().remove_child(self)

func _set_optional_attrs(state):
	if "idle_move_speed" in state:
		state.idle_move_speed = idle_move_speed
	if "follow_move_speed" in state:
		state.follow_move_speed = follow_move_speed
	if "follow_distance" in state:
		state.follow_distance = follow_distance
	if "attack_distance" in state:
		state.attack_distance = attack_distance
	if "ranged" in state:
		state.ranged = ranged
	if "attack_speed_timer" in state:
		state.attack_speed_timer = attack_speed_timer
	if "grounded" in state:
		state.grounded = grounded
	if "bullet" in state:
		state.bullet_texture = bullet_texture
	if "ranged_dmg" in state:
		state.ranged_dmg = ranged_dmg

func _facing():
	var direction = global_position.direction_to(player.global_position)
	if animator.current_animation == "attack":
		return
	if direction.x < 0 and facing_right == true:
		facing_right = false
		scale.x = scale.x * -1
	elif  direction.x > 0  and facing_right == false:
		facing_right = true
		scale.x = scale.x * -1
		
func suicide():
	get_parent().remove_child(self)
