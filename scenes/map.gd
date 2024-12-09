extends Level

var test_mode = false

var exceptions = [
	Main.Level.HELL,
	Main.Level.HEAVENS_GATE,
	Main.Level.SNOW_VILLAGE,
]

@onready var level_to_scene = {
	Main.Level.HELL: $Map/MarginContainer/ScrollContainer/VBoxContainer/Hell/hello,
	Main.Level.HELL_ROME: $Map/MarginContainer/ScrollContainer/VBoxContainer/Hell/hell_rome,
	Main.Level.HELL_SPIRAL: $Map/MarginContainer/ScrollContainer/VBoxContainer/Hell/hell_spiral,
	Main.Level.GARGOYLE_GATE: $Map/MarginContainer/ScrollContainer/VBoxContainer/Hell/gargoyles_gate,
	Main.Level.HEAVENS_GATE: $Map/MarginContainer/ScrollContainer/VBoxContainer/Heaven/heavans_gate,
	Main.Level.SNOW_VILLAGE: $Map/MarginContainer/ScrollContainer/VBoxContainer/Earth/snow_village,
	Main.Level.FOREST1: $Map/MarginContainer/ScrollContainer/VBoxContainer/Earth/forest_1,
	Main.Level.FOREST2: $Map/MarginContainer/ScrollContainer/VBoxContainer/Earth/forest_2,
	Main.Level.FOREST3: $Map/MarginContainer/ScrollContainer/VBoxContainer/Earth/forest_3,
	Main.Level.DUCK_VILLAGE: $Map/MarginContainer/ScrollContainer/VBoxContainer/Earth/duck_village,
	Main.Level.AZTEC_TEMPLE: $Map/MarginContainer/ScrollContainer/VBoxContainer/Earth/aztec_temple,
	Main.Level.HEAVEN1: $Map/MarginContainer/ScrollContainer/VBoxContainer/Heaven/heaven_1,
	Main.Level.HEAVEN2: $Map/MarginContainer/ScrollContainer/VBoxContainer/Heaven/heaven_2,
	Main.Level.HEAVEN3: $Map/MarginContainer/ScrollContainer/VBoxContainer/Heaven/heaven_3,
	Main.Level.HEAVEN4: $Map/MarginContainer/ScrollContainer/VBoxContainer/Heaven/heaven_4,
	Main.Level.SNOW_CITY: $Map/MarginContainer/ScrollContainer/VBoxContainer/Earth/snow_city,
	Main.Level.HELL_TOWER: $Map/MarginContainer/ScrollContainer/VBoxContainer/Hell/hell_tower,
	Main.Level.HELL_HOUSE: $Map/MarginContainer/ScrollContainer/VBoxContainer/Hell/hell_house,
	Main.Level.HELL_VILLAGE: $Map/MarginContainer/ScrollContainer/VBoxContainer/Hell/hell_village,
	Main.Level.HOLGARMESTERI_HIVATAL: $Map/MarginContainer/ScrollContainer/VBoxContainer/Earth/holgarmesteri_hivatal,
	Main.Level.SNOW_CITY_HOUSES: $Map/MarginContainer/ScrollContainer/VBoxContainer/Earth/snow_city_houses,
	Main.Level.HELL_CAVE_1: $Map/MarginContainer/ScrollContainer/VBoxContainer/Hell/hell_cave_1,
	Main.Level.HELL_CAVE_2: $Map/MarginContainer/ScrollContainer/VBoxContainer/Hell/hell_cave_2,
	Main.Level.HEAVEN_KAPU: $Map/MarginContainer/ScrollContainer/VBoxContainer/Heaven/heaven_kapu,
	Main.Level.HEAVEN_HOUSE: $Map/MarginContainer/ScrollContainer/VBoxContainer/Heaven/heaven_house,
	Main.Level.HEAVEN_JAPAN: $Map/MarginContainer/ScrollContainer/VBoxContainer/Heaven/heaven_japan,
}

func _ready() -> void:
	super._ready()
	if test_mode:
		return
	for level in level_to_scene:
		if level in exceptions:
			continue
		level_to_scene[level].visible=false
	
func show_level(level):
	if level not in level_to_scene or level_to_scene[level].visible == true:
		return
	level_to_scene[level].visible = true
