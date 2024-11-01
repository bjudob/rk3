extends StaticBody2D

@export var game_ui: GameUI

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("talk") and Dialogic.current_timeline == null:
		Dialogic.start("hello_to_hell")
		game_ui.hide_tooltip()


func _show_tooltip(body: Node2D) -> void:
	if body is not Reki:
		return
	game_ui.show_tooltip("Press E to talk")


func _hide_tooltip(body: Node2D) -> void:
	if body is not Reki:
		return
	game_ui.hide_tooltip()
