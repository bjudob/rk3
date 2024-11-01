class_name GameUI
extends CanvasLayer

@export var reki: Reki
@export var game_ui: GameUI
@export var main: Main

@onready var tooltip = $Tooltip

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass

func show_tooltip(text: String):
	tooltip.show_tooltip(text)

func hide_tooltip():
	tooltip.hide_tooltip()
