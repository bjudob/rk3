class_name Itemable
extends StaticBody2D

@export var item_needed: String

@onready var item_follow = get_tree().get_nodes_in_group("item_follow")[0]
@onready var inventory = get_tree().get_nodes_in_group("inventory")[0]
@onready var reki = get_tree().get_nodes_in_group("player")[0]
@onready var game_ui = get_tree().get_nodes_in_group("game_ui")[0]
@onready var main = get_tree().get_nodes_in_group("main")[0]

@onready var SHADER = preload("res://shaders/itemable_highlight.gdshader")

var itemable_area: Area2D
var sprite: Sprite2D

func _ready() -> void:
	_find_itemable_area()
	_find_sprite()
	itemable_area.connect("input_event", _on_itemable_area_input_event)
	add_to_group("itemable")

func _process(delta: float) -> void:
	pass

func _on_itemable_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
		if not item_follow.is_active() or not item_follow.selected_item:
			return
		var item = item_follow.selected_item
		print(item.id)
		print(item_needed)
		if item.id == item_needed:
			_on_item_correct(item)
			if item.destroy_on_use:
				inventory.remove_item(item)
				
func _on_item_correct(item):
	pass

func _find_itemable_area():
	for child in get_children():
		if child.name == "ItemableArea":
			itemable_area = child
			return

func _find_sprite():
	for child in get_children():
		if child is Sprite2D and child.visible:
			sprite = child
			return

func _highlight():
	_find_sprite()
	sprite.material = ShaderMaterial.new()
	sprite.material.shader = SHADER

func _lowlight():
	sprite.material = null
