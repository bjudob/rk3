class_name Main
extends Node2D

enum Level {
	MAIN_MENU,
	HELL,
	HELL_ROME,
	HEAVENS_GATE,
	SNOW_VILLAGE,
}

enum Snow {
	SNOW,
	SNOW_HELL,
}

@onready var level_to_scene = {
	Level.MAIN_MENU: $MainMenu,
	Level.HELL: $Hell,
	Level.HELL_ROME: $HellRome,
	Level.HEAVENS_GATE: $HeavensGate,
	Level.SNOW_VILLAGE: $SnowVillage,
}

@onready var snow_to_scene = {
	Snow.SNOW: $Snowy/Snow,
	Snow.SNOW_HELL: $Snowy/SnowHell,
}

@onready var game_ui = $GameUI
@onready var reki = $Reki
@onready var background_music = $BackgroundMusic

var current_level = null
var left_level = null
var right_level = null

func _ready() -> void:
	change_scene(Level.MAIN_MENU)

func _process(delta: float) -> void:
	pass

func change_scene(level: Main.Level):
	print(level)
	var level_scene = level_to_scene[level]
	if not has_child(level_to_scene[level]):
		current_level = level
		left_level = level_scene.left
		right_level = level_scene.right
		add_child(level_scene)
		play_music(level_scene)
	for scene in level_to_scene:
		if scene == level or not has_child(level_to_scene[scene]):
			continue
		remove_child(level_to_scene[scene])
		
	# do we need GameUI
	if level == Level.MAIN_MENU and has_child(game_ui):
		remove_child(game_ui)
		remove_child(reki)
	if level != Level.MAIN_MENU and not has_child(game_ui):
		add_child(game_ui)
		add_child(reki)
	
	# set snow
	for snow in snow_to_scene:
		if level_scene.snow == snow:
			snow_to_scene[snow].visible = true
		else:
			snow_to_scene[snow].visible = false
		

func has_child(node: Node):
	for child in get_children():
		if child == node:
			return true
	return false
	
func play_music(level_scene):
	if background_music.stream != level_scene.background_music:
		background_music.stream = level_scene.background_music
		background_music.play()

func _on_background_music_finished() -> void:
	$BackgroundMusic.play()
