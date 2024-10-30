extends StaticBody2D

@export var game_ui: GameUI
@onready var tooltip = game_ui.tooltip

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("talk") and Dialogic.current_timeline == null:
		Dialogic.start("hello_to_hell")
		tooltip.hide_tooltip()


func _show_tooltip(body: Node2D) -> void:
	if body is not Reki:
		return
	tooltip.show_tooltip("Press E to talk")


func _hide_tooltip(body: Node2D) -> void:
	if body is not Reki:
		return
	tooltip.hide_tooltip()
