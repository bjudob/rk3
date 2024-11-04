class_name Itemable
extends StaticBody2D

@export var item_needed: String

@onready var item_follow = get_tree().get_nodes_in_group("item_follow")[0]
@onready var inventory = get_tree().get_nodes_in_group("inventory")[0]
@onready var reki = get_tree().get_nodes_in_group("player")[0]
@onready var game_ui = get_tree().get_nodes_in_group("game_ui")[0]
@onready var main = get_tree().get_nodes_in_group("main")[0]

var itemable_area: Area2D

func _ready() -> void:
	for child in get_children():
		if child.name == "ItemableArea":
			itemable_area = child
	itemable_area.connect("input_event", _on_itemable_area_input_event)

func _process(delta: float) -> void:
	pass

func _on_itemable_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
		if not item_follow.is_active() or not item_follow.selected_item:
			return
		var item = item_follow.selected_item
		if item.id == item_needed:
			_on_item_correct(item)
			if item.destroy_on_use:
				inventory.remove_item(item)
				
func _on_item_correct(item):
	pass
