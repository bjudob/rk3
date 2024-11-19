class_name NPC
extends Itemable

@export var current_dialog = "hello_to_hell"

@onready var OUTLINE_SHADER = preload("res://shaders/outline.gdshader")

var in_talk_range = false
var talk_area: Area2D

func _ready() -> void:
	super._ready()
	for child in get_children():
		if child.name == "TalkArea":
			talk_area = child
	talk_area.connect("body_entered", _on_body_entered)
	talk_area.connect("body_exited", _on_body_exited)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("talk") and Dialogic.current_timeline == null and in_talk_range:
		Dialogic.start(current_dialog)
		game_ui.hide_tooltip()

func _on_body_entered(body: Node2D) -> void:
	if body is not Reki:
		return
	in_talk_range = true
	# tooltip
	owner.game_ui.show_tooltip("Press E to talk")
	# outline
	sprite.material = ShaderMaterial.new()
	sprite.material.shader = OUTLINE_SHADER
	
func _on_body_exited(body: Node2D) -> void:
	if body is not Reki:
		return
	in_talk_range = false
	owner.game_ui.hide_tooltip()
	Dialogic.end_timeline()
	sprite.material = null
