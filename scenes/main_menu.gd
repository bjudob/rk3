extends Control

@onready var play_button = $MarginContainer/VBoxContainer/Play
@onready var load_button = $MarginContainer/VBoxContainer/Load
@onready var exit_button = $MarginContainer/VBoxContainer/Exit

@onready var hover_sound = $MarginContainer/HoverSound

func _on_play_gui_input(event: InputEvent) -> void:
	if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
		get_tree().change_scene_to_file("res://scenes/hello.tscn")

func _on_load_gui_input(event: InputEvent) -> void:
	if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
		pass

func _on_exit_gui_input(event: InputEvent) -> void:
	if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
		get_tree().quit()


func _on_play_mouse_entered() -> void:
	play_button.texture =  load("res://ui/winter_button_play_hover.png")
	hover_sound.play()


func _on_play_mouse_exited() -> void:
	play_button.texture =  load("res://ui/winter_button_play.png")


func _on_load_mouse_entered() -> void:
	load_button.texture =  load("res://ui/winter_button_load_hover.png")
	hover_sound.play()


func _on_load_mouse_exited() -> void:
	load_button.texture =  load("res://ui/winter_button_load.png")


func _on_exit_mouse_entered() -> void:
	exit_button.texture =  load("res://ui/winter_button_exit_hover.png")
	hover_sound.play()


func _on_exit_mouse_exited() -> void:
	exit_button.texture =  load("res://ui/winter_button_exit.png")