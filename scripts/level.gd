class_name Level
extends Node2D

@export var right: Main.Level = Main.Level.HELL
@export var left: Main.Level = Main.Level.HELL
@export var background_music = load("res://audio/54 - Town - Rampart.mp3")

@onready var reki = get_tree().get_nodes_in_group("player")[0]
@onready var game_ui = get_tree().get_nodes_in_group("game_ui")[0]
@onready var main = get_tree().get_nodes_in_group("main")[0]

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
