class_name Main
extends Node2D

enum Level {
	MAIN_MENU,
	HELL,
	HEAVEN,
}

@onready var level_to_node = {
	Level.MAIN_MENU: $MainMenu,
	Level.HELL: $Hell,
	Level.HEAVEN: $HeavensGate,
}

@onready var game_ui = $GameUI
@onready var reki = $Reki

var current_level = null
var left_level = null
var right_level = null

func _ready() -> void:
	change_scene(Level.MAIN_MENU)

func _process(delta: float) -> void:
	pass

func change_scene(level: Main.Level):
	if not has_child(level_to_node[level]):
		current_level = level
		left_level = level_to_node[level].left
		right_level = level_to_node[level].right
		add_child(level_to_node[level])
	for scene in level_to_node:
		if scene == level:
			continue
		remove_child(level_to_node[scene])
		
	# do we need GameUI
	if level == Level.MAIN_MENU and has_child(game_ui):
		remove_child(game_ui)
		remove_child(reki)
	if level != Level.MAIN_MENU and not has_child(game_ui):
		add_child(game_ui)
		add_child(reki)
		

func has_child(node: Node):
	for child in get_children():
		if child == node:
			return true
	return false
