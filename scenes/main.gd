class_name Main
extends Node2D

enum Scene {
	MAIN_MENU,
	HELL,
}

@onready var scene_to_node = {
	Scene.MAIN_MENU: $MainMenu,
	Scene.HELL: $Hell,
}

func _ready() -> void:
	change_scene(Scene.MAIN_MENU)

func _process(delta: float) -> void:
	pass

func change_scene(scene_name: Scene):
	add_child(scene_to_node[scene_name])
	for scene in scene_to_node:
		if scene == scene_name:
			continue
		remove_child(scene_to_node[scene])
