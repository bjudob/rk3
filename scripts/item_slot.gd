class_name ItemSlot
extends MarginContainer

var background: ColorRect
var image: TextureRect

const COLOR_DEFAULT = Color.LIGHT_SLATE_GRAY
const COLOR_HOVER = Color.CORNFLOWER_BLUE
const COLOR_SELECTED = Color.DARK_CYAN

var selected = false

@onready
var inventory = get_tree().get_nodes_in_group("inventory")[0]
var current_item = null

func _ready() -> void:
	background = get_child(0)
	image = get_child(1)
	background.color = COLOR_DEFAULT
	
	connect("mouse_entered", _on_mouse_entered)
	connect("mouse_exited", _on_mouse_exited)
	connect("gui_input", _on_gui_input)
	
func set_item(item: Item):
	if not item:
		image.texture = null
		current_item = null
		return
	image.texture = item.image
	current_item = item

func _on_mouse_entered() -> void:
	if selected or not current_item:
		return
	background.color = COLOR_HOVER

func _on_mouse_exited() -> void:
	if selected or not current_item:
		return
	background.color = COLOR_DEFAULT

func _on_gui_input(event: InputEvent) -> void:
	if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
		print(current_item)
		inventory.select_item(self, current_item)

func select_item():
	if not current_item:
		return
	background.color = COLOR_SELECTED
	selected = true
	
func deselect_item():
	background.color = COLOR_DEFAULT
	selected = false
