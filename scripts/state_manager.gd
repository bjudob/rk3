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


func _process(delta: float) -> void:
	current_state.update(delta)

func _physics_process(delta: float) -> void:
	current_state.physics_update(delta)
	
func _change_state(old_state, new_state_name):
	if old_state != current_state:
		return
	if current_state:
		current_state.exit()
	var new_state = states[new_state_name]
	new_state.enter()
	current_state = new_state
	
