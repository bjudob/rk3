class_name Main
extends Node2D

enum Scene {
	MAIN_MENU,
	HELL,
}

@onready var level_to_node = {
	Scene.MAIN_MENU: $MainMenu,
	Scene.HELL: $Hell,
}

@onready var game_ui = $GameUI
@onready var reki = $Reki

func _ready() -> void:
	change_scene(Scene.MAIN_MENU)

func _process(delta: float) -> void:
	pass

func change_scene(scene_name: Scene):
	if not has_child(level_to_node[scene_name]):
		add_child(level_to_node[scene_name])
	for scene in level_to_node:
		if scene == scene_name:
			continue
		remove_child(level_to_node[scene])
		
	# do we need GameUI
	if scene_name == Scene.MAIN_MENU and has_child(game_ui):
		remove_child(game_ui)
		remove_child(reki)
	if scene_name != Scene.MAIN_MENU and not has_child(game_ui):
		add_child(game_ui)
		add_child(reki)
		

func has_child(node: Node):
	for child in get_children():
		if child == node:
			return true
	return false
