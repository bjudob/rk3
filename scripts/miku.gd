class_name Miku
extends NPC

var gift_1_given = false

func _ready() -> void:
	super._ready()
	Dialogic.signal_event.connect(_on_dialogic)
	
func _process(delta: float) -> void:
	super._process(delta)
	if main.event_happened(Main.GameEvents.GIFTED_PINGU):
		current_dialog = "miku_gift_2"

func _on_item_correct(item):
	current_dialog = "miku_2"

func _on_dialogic(arg):
	if arg == "miku_gift" and not gift_1_given:
		gift_1_given = true
		inventory.add_item($Item)
