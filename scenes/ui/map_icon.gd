extends TextureRect

@onready var main = get_tree().get_nodes_in_group("main")[0]
@onready var sound = $"../../ClickSound"

func _ready() -> void:
	connect("mouse_entered", _on_mouse_entered)
	connect("mouse_exited", _on_mouse_exited)
	connect("gui_input", _on_gui_input)

func _on_mouse_entered():
	modulate = Color(0.5, 0.6, 0.4)
	
func _on_mouse_exited():
	modulate = Color(1, 1, 1)

func _on_gui_input(event: InputEvent) -> void:
	if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
		sound.play()
		main.change_scene(main.Level.MAP)
