extends Control
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HUDScoreCoins.hide()
#	GlobalHighScore.score_collected.emit() #if on: score goes back to 0 then increment
	$gameover.play()
	await get_tree().create_timer(0.9).timeout
	$yousuckAudio.play()
	$ColorRect/score_x.text = str(GlobalHighScore.score)
	print("from main: ", GlobalHighScore.score) # this works
	
	if GlobalHighScore.score < 5:
		$"ColorRect/you suck_shadow".show()
		$"ColorRect/you suck".show()
func last_score_collected():
	print_debug("last_score_printed: ", GlobalHighScore.score)
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
