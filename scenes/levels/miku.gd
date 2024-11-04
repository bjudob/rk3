class_name Miku
extends NPC

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("talk") and Dialogic.current_timeline == null and in_talk_range:
		Dialogic.start("miku_hello")
		owner.game_ui.hide_tooltip()
