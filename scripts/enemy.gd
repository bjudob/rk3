class_name Enemy
extends HP

enum StateEnum{
	IDLE,
	FOLLOW,
	ATTACK,
}

@onready
var player = get_tree().get_nodes_in_group("player")[0]  
@export var souls = 50
@export var is_demon = true
@export var states_list: Array[StateEnum] = [StateEnum.IDLE, StateEnum.FOLLOW, StateEnum.ATTACK]
const initial_state = StateEnum.IDLE
var current_state: State
var current_state_enum: StateEnum

var states_dict = {
	StateEnum.IDLE: StateIdle,
	StateEnum.FOLLOW: StateFollow,
	StateEnum.ATTACK: StateAttack,
}

var states = {}

func _ready() -> void:
	for state_enum in states_list:
		var state = states_dict[state_enum].new()
		state.this = self
		state.player = player
		state.animator = animator
		add_child(state)
		states[state_enum] = state
		state.StateTransition.connect(_change_state)
	current_state = states[initial_state]

func _process(delta: float) -> void:
	super._process(delta)
	current_state.update(delta)

func _physics_process(delta: float) -> void:
	current_state.physics_update(delta)
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
	self.queue_free()
	health_changed.emit()
	game_ui.add_souls(souls, is_demon)
