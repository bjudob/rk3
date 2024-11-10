class_name Enemy
extends HP

enum StateEnum{
	IDLE,
	FOLLOW,
	ATTACK,
}

@export var souls = 50
@export var is_demon = true
@export var states: Array[StateEnum] = [StateEnum.IDLE, StateEnum.FOLLOW, StateEnum.ATTACK]
const initial_state = StateEnum.IDLE
var current_state: State
var current_state_enum: StateEnum

var states_dict = {
	StateEnum.IDLE: StateIdle,
	StateEnum.FOLLOW: StateFollow,
	StateEnum.ATTACK: StateAttack,
}

func _ready() -> void:
	for state_enum in states:
		var state = states_dict[state_enum].new()
		add_child(state)

func _physics_process(delta: float) -> void:
	move_and_slide()

func _die():
	self.queue_free()
	health_changed.emit()
	game_ui.add_souls(souls, is_demon)
