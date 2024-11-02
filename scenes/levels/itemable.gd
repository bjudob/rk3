class_name Itemable
extends StaticBody2D

@export var item_needed: String
@onready var item_follow = get_tree().get_nodes_in_group("item_follow")[0]

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_itemable_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
		if not item_follow.is_active():
			return
		if item_follow.selected_item.id == item_needed:
			print("Item " + item_follow.selected_item.id + " found!!!")
			item_needed = "gems"
		else:
			print("Item " + item_follow.selected_item.id + " is not gud")
