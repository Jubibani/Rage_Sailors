extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#GlobalMusic.play()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_released() -> void:
	$buttonAudio.play()
	get_tree().change_scene_to_file("res://scenes/maingame.tscn")


func _on_exit_released() -> void:
	get_tree().quit()



func _on_maps_released() -> void:
	$buttonAudio.play()
	get_tree().change_scene_to_file("res://scenes/dev.tscn")


func _on_options_released() -> void:
	$buttonAudio.play()
	get_tree().change_scene_to_file("res://scenes/dev.tscn")


func _on_skins_released() -> void:
	$buttonAudio.play()
	get_tree().change_scene_to_file("res://scenes/dev.tscn")
