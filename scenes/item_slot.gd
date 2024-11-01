class_name ItemSlot
extends MarginContainer

var image: TextureRect

func _ready() -> void:
	image = get_child(1)
	
func set_item(item: Item):
	if not item:
		image.texture = null
		return
	image.texture = item.image
