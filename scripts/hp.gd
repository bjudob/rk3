class_name HP
extends CharacterBody2D

@export var max_hp = 100
@export var animator:AnimationPlayer
@export var hit_sound:Resource = load("res://audio/cat_hit.mp3")
@export var hit_sound_volume = 1

@onready var current_hp = max_hp
@onready var game_ui = get_tree().get_nodes_in_group("game_ui")[0]

var hit_audio: AudioStreamPlayer

signal health_changed

func _ready() -> void:
	hit_audio = AudioStreamPlayer.new()
	hit_audio.set_stream(hit_sound)
	hit_audio.volume_db = hit_sound_volume
	add_child(hit_audio)
	print(hit_audio)


func _process(delta: float) -> void:
	if current_hp < 0:
		_die()

func take_damage(dmg: int):
	current_hp -= dmg
	if animator.current_animation!="attack":
		animator.play("hurt")
	health_changed.emit()
	if dmg > 0:
		play_hit_sound()
	
func _die():
	pass

func play_hit_sound():
	hit_audio.play()
