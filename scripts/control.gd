extends Control
@onready var buttonAudio = $ColorRect/buttonAudio
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HUDScoreCoins.hide()
	#GlobalMusic.play()
	#GlobalLobbyAudio.play()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# -------------------button for scenes------------------
func _on_start_released() -> void:
	get_tree().change_scene_to_file("res://scenes/maingame.tscn")


func _on_exit_released() -> void:
	get_tree().quit()


func _on_maps_released() -> void:
	get_tree( ).change_scene_to_file("res://scenes/dev.tscn")


func _on_options_released() -> void:
	get_tree().change_scene_to_file("res://scenes/dev.tscn")


func _on_skins_released() -> void:
	get_tree().change_scene_to_file("res://scenes/skins.tscn")
	
# from overvation: The node ButtonAudkinio properties is set to "autoplay" That is why there
# is a sound after button click not because of the func you set but because of auto play.
# so therefore, your code needs mmore polishing and checking.
