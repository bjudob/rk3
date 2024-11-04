class_name NPC
extends Itemable

var in_talk_range = false
var talk_area: Area2D

func _ready() -> void:
	super._ready()
	for child in get_children():
		if child.name == "TalkArea":
			talk_area = child
	talk_area.connect("body_entered", _show_tooltip)
	talk_area.connect("body_exited", _hide_tooltip)

func _process(delta: float) -> void:
	pass

func _show_tooltip(body: Node2D) -> void:
	if body is not Reki:
		return
	in_talk_range = true
	owner.game_ui.show_tooltip("Press E to talk")


func _hide_tooltip(body: Node2D) -> void:
	if body is not Reki:
		return
	in_talk_range = false
	owner.game_ui.hide_tooltip()
