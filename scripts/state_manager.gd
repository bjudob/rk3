class_name StateMachine
extends Node

@export
var initial_state: State

var current_state: State
var states = {}

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name] = child
			child.StateTransition.connect(_change_state)
	current_state = initial_state
	print(current_state.name)


func _process(delta: float) -> void:
	current_state._process(delta)

func _physics_process(delta: float) -> void:
	current_state._physics_process(delta)
	
func _change_state(old_state, new_state_name):
	if old_state != current_state:
		return
	print("still here")
	if current_state:
		current_state._exit()
	print("and still")
	var new_state = states[new_state_name]
	print(new_state.name)
	new_state._enter()
	current_state = new_state
	
