extends Node



signal global_pause

func _to_pause():
	get_tree().paused = true

func _to_unpause():
	get_tree().paused = false
