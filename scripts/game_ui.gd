class_name GameUI
extends CanvasLayer

@onready var tooltip = $Tooltip

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass

func show_tooltip(text: String):
	tooltip.show_tooltip(text)

func hide_tooltip():
	tooltip.hide_tooltip()
