extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$gameover.play()
	await get_tree().create_timer(0.9).timeout
	$yousuckAudio.play()
#	text = str(GlobalHighScore.score_collected.connect(_on_score_collected))


func _on_last_score_collected() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_retry_released() -> void:
	get_tree().change_scene_to_file("res://scenes/maingame.tscn")


func _on_menu_released() -> void:
	get_tree().change_scene_to_file("res://scenes/control.tscn")


func _on_retry_pressed() -> void:
	$buttonAudio.play()


func _on_menu_pressed() -> void:
	$buttonAudio.play()


func _on_timer_timeout() -> void:
	pass # Replace with function body.
