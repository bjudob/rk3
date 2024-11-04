extends NPC

func _on_item_correct(item):
	$Flames.visible = true

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("talk") and Dialogic.current_timeline == null and in_talk_range:
		Dialogic.start("hello_to_hell")
		owner.game_ui.hide_tooltip()
