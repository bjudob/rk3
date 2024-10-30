class_name Tooltip
extends RichTextLabel


func _ready() -> void:
	visible = false


func _process(delta: float) -> void:
	pass

func show_tooltip(text: String):
	text = text
	visible = true

func hide_tooltip():
	visible = false
