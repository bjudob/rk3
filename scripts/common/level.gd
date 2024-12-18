class_name Level
extends Node2D

@export var right: Main.Level = Main.Level.HELL
@export var left: Main.Level = Main.Level.HELL
@export var snow: Main.Snow = Main.Snow.SNOW
@export var background_music = load("res://audio/Dark Christmas Soundtrack [No Copyright Sound] [ FREE USE MUSIC ] - Myuu - Santa's Tricks.mp3")

@onready var reki = get_tree().get_nodes_in_group("player")[0]
@onready var game_ui = get_tree().get_nodes_in_group("game_ui")[0]
@onready var main = get_tree().get_nodes_in_group("main")[0]

var enemies = []

func _ready() -> void:
	for child in get_children():
		if child is Enemy:
			enemies.append(child)

func respawn_enemies():
	for enemy in enemies:
		if has_child(enemy):
			continue
		add_child(enemy)
		enemy.reset_position()
		enemy.current_hp = enemy.max_hp
		enemy.health_changed.emit()
		
func has_enemies():
	for enemy in enemies:
		if has_child(enemy):
			return true
	return false

func has_child(node: Node):
	for child in get_children():
		if child == node:
			return true
	return false

func hide_ui():
	main.hide_ui()
	
func show_ui():
	main.show_ui()
