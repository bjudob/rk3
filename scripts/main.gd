class_name Main
extends Node2D

signal LevelTransition

enum GameEvents {
	GIFTED_PINGU,
}

enum Level {
	# ui
	MAIN_MENU,
	MAP,
	# heaven
	HEAVENS_GATE,
	HEAVEN1,
	HEAVEN2,
	HEAVEN3,
	HEAVEN4,
	# earth
	SNOW_VILLAGE,
	SNOW_CITY,
	DUCK_VILLAGE,
	AZTEC_TEMPLE,
	FOREST1,
	FOREST2,
	FOREST3,
	# hell
	HELL,
	HELL_ROME,
	HELL_SPIRAL,
	GARGOYLE_GATE,
	HELL_TOWER,
	HELL_HOUSE,
	HELL_VILLAGE,
	
	HOLGARMESTERI_HIVATAL,
	SNOW_CITY_HOUSES,
	HELL_CAVE_1,
	HELL_CAVE_2,
	JAPAN_LAKE,
	HEAVEN_KAPU,
	HEAVEN_HOUSE,
	HEAVEN_JAPAN,
}

enum Snow {
	SNOW,
	SNOW_HELL,
}

@onready var level_to_scene = {
	Level.MAIN_MENU: $MainMenu,
	Level.MAP: $Map,
	Level.HELL: $Hell,
	Level.HELL_ROME: $HellRome,
	Level.HELL_SPIRAL: $HellSpiral,
	Level.GARGOYLE_GATE: $GargoyleGate,
	Level.HEAVENS_GATE: $HeavensGate,
	Level.SNOW_VILLAGE: $SnowVillage,
	Level.FOREST1: $Forest1,
	Level.FOREST2: $Forest2,
	Level.FOREST3: $Forest3,
	Level.DUCK_VILLAGE: $DuckVillage,
	Level.AZTEC_TEMPLE: $AztecTemple,
	Level.HEAVEN1: $Heaven1,
	Level.HEAVEN2: $Heaven2,
	Level.HEAVEN3: $Heaven3,
	Level.HEAVEN4: $Heaven4,
	Level.SNOW_CITY: $SnowCity,
	Level.HELL_TOWER: $HellTower,
	Level.HELL_HOUSE: $HellHouse,
	Level.HELL_VILLAGE: $HellVillage,
	Level.HOLGARMESTERI_HIVATAL: $HolgarmesteriHivatal,
	Level.SNOW_CITY_HOUSES: $SnowCityHouses,
	Level.HELL_CAVE_1: $HellCave,
	Level.HELL_CAVE_2: $HellCave2,
	Level.JAPAN_LAKE: $JapanLake,
	Level.HEAVEN_KAPU: $HeavenKapu,
	Level.HEAVEN_HOUSE: $HeavenHouse,
	Level.HEAVEN_JAPAN: $HeavenJapan,
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

var events = []

func _ready() -> void:
	change_scene(Level.MAIN_MENU)

func _process(delta: float) -> void:
	pass

func change_scene(level: Main.Level):
	var level_scene = level_to_scene[level]
	if not has_child(level_to_scene[level]):
		LevelTransition.emit()
		current_level = level
		left_level = level_scene.left
		right_level = level_scene.right
		add_child.call_deferred(level_scene)
		play_music.call_deferred(level_scene)
		level_scene.respawn_enemies()
	for scene in level_to_scene:
		if scene == level or not has_child(level_to_scene[scene]):
			continue
		remove_child(level_to_scene[scene])
		
	# do we need GameUI
	if (level == Level.MAIN_MENU or level == Level.MAP) and has_child(game_ui):
		remove_child(game_ui)
		remove_child(reki)
	if (level != Level.MAIN_MENU and level != Level.MAP) and not has_child(game_ui):
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
	if level_scene.background_music and background_music.stream != level_scene.background_music:
		background_music.stream = level_scene.background_music
		background_music.play()

func _on_background_music_finished() -> void:
	$BackgroundMusic.play()

func add_event(event):
	events.append(event)

func event_happened(event):
	var i = 0
	for e in events:
		if e == event:
			events.remove_at(i)
			return true
		i += 1
	return false
