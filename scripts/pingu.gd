extends NPC

@export var animation_player: AnimationPlayer
@export var foki: Foki

@onready var pingu_beteg = load("res://characters/pingu_beteg.png")
@onready var original_texture = $Pingu.texture

func _ready() -> void:
	super._ready()
	if foki:
		visible = false
		$ItemableArea/CollisionShape2D.disabled = true
		$TalkArea/CollisionShape2D.disabled = true

func _process(delta: float) -> void:
	super._process(delta)
	if main.event_happened(Main.GameEvents.PINGU_BETEG):
		visible = true
		$ItemableArea/CollisionShape2D.disabled = false
		$Pingu.texture = pingu_beteg
		item_needed = "adrenaline"
		
func _on_item_correct(item):
	if item.id == "gift_pingu":
		current_dialog = "pingu_eltunt_barat"
		Dialogic.start(current_dialog)
		game_ui.hide_tooltip()
		item_needed = "szanko"
		main.add_event(Main.GameEvents.GIFTED_PINGU)
		return
	if item.id == "adrenaline":
		$Pingu.texture = original_texture
		current_dialog = "pingu_gyogyul"
		Dialogic.start(current_dialog)
		game_ui.hide_tooltip()
		foki.pingu_megvan()
	if animation_player:
		animation_player.play("pingu_szanko")
