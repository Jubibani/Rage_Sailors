extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Calle"d every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_menu_released() -> void:
	get_tree().paused = false
	# i observed if get_tree().paused = false is not added.
	# it will go to the other scene but the game will freeze.
	get_tree().change_scene_to_file("res://scenes/control.tscn")

func _on_pause_timer_timeout():
	print_debug("timer started")
