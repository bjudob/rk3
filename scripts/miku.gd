class_name Miku
extends NPC

var gift_pingu_given = false
var gift_nyuszi_given = false
var gifts_finished = false

func _ready() -> void:
	super._ready()
	Dialogic.signal_event.connect(_on_dialogic)
	
func _process(delta: float) -> void:
	super._process(delta)
	if main.event_happened(Main.GameEvents.GIFTED_PINGU):
		current_dialog = "miku_gift_2"
	if main.event_happened(Main.GameEvents.GIFTED_NYUSZI):
		current_dialog = "miku_gift_3"

func _on_item_correct(item):
	if item.id == "ollo":
		inventory.add_item($ItemMikuSzakall)
		item_needed = "chalice"
	if item.id == "chalice":
		$"../AnimationPlayer".play("pisi")
		main.add_event(Main.GameEvents.PISI)

func _on_dialogic(arg):
	if arg == "miku_gift_pingu" and not gift_pingu_given:
		gift_pingu_given = true
		inventory.add_item($ItemGiftPingu)
	if arg == "miku_gift_carrot_cake" and not gift_nyuszi_given:
		gift_nyuszi_given = true
		inventory.add_item($ItemCarrotCake)
	if arg == "miku_gift_finished" and not gifts_finished:
		gifts_finished = true
		inventory.add_item($ItemSzantaZsak)
	
