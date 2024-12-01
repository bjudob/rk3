extends NPC

func _on_repaired():
	current_dialog = "maci_repaired"
	main.connect("LevelTransition", _on_level_transition)
	
func _on_level_transition():
	queue_free()
