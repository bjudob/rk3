extends StaticBody2D

@onready
var tooltip = $"../CanvasLayer/PressEtoTalk"

func _ready() -> void:
	tooltip.visible = false


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("talk") and Dialogic.current_timeline == null:
		Dialogic.start("hello_to_hell")
		tooltip.visible = false


func _show_tooltip(body: Node2D) -> void:
	if body is not Reki:
		return
	print("not ok")
	tooltip.visible = true


func _hide_tooltip(body: Node2D) -> void:
	if body is not Reki:
		return
	tooltip.visible = false
