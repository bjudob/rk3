extends Sprite2D

const width = 100.0

@onready var area_2d = $Area2D
@onready var timer = $Timer
@onready var inventory = get_tree().get_nodes_in_group("inventory")[0]

func _ready() -> void:
	texture = null
	area_2d.visible = false

func _physics_process(delta: float) -> void:
	position = get_global_mouse_position()

func select_image(image: CompressedTexture2D):
	texture = image
	scale.x = width/texture.get_width()
	scale.y = width/texture.get_width()
	timer.start()
	
func deselect_image():
	texture = null
	area_2d.visible = false

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
		if not texture:
			return
		inventory.deselect_item()
		


func _on_timer_timeout() -> void:
	area_2d.visible = true
