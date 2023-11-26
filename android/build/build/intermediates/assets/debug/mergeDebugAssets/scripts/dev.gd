extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#GlobalMusic.play()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_menu_released() -> void:
	get_tree().change_scene_to_file("res://scenes/control.tscn")

	
# from overvation: The node ButtonAudio properties is set to "autoplay" That is why there
# is a sound after button click not because of the func you set but because of auto play.
# so therefore, your code needs mmore polishing and checking.


func _on_on_released() -> void:
	GlobalLobbyAudio.play()


func _on_off_released() -> void:
	GlobalLobbyAudio.stop()
