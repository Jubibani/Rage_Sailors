extends Control

@onready var highscore = GlobalHighscore.highscore
@onready var score = GlobalScore.score

var save_path := "user://variable.save"

func _ready() -> void:
	$HUDScoreCoins.hide()
	$yousuckAudio.play()
	$ColorRect/Highescore_x.text = str(GlobalScore.score)
	$ColorRect/score_x.text = str(GlobalScore.score)
	
	load_highscore()
	player_score()
	print("from main: ", GlobalScore.score) # this works
	
	# commentator
	if GlobalScore.score <= 5:
		$"ColorRect/you suck_shadow".show()
		$"ColorRect/you suck".show()
	if GlobalScore.score > 5:
		$ColorRect/boullets_shadow.show()
		$ColorRect/boullets.show()
		$ColorRect/boullets_white.show()
		
	
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

#	save function (highscore)
func player_score():
	highscore = score
	$ColorRect/Highescore_x.text = str(GlobalHighscore.highscore)
	$ColorRect/score_x.text = str(GlobalScore.score)
	_set_highscore()
	
func set_new_highscore():
	GlobalHighscore.highscore = GlobalScore.score
	$ColorRect/Highescore_x.text = str(GlobalHighscore.highscore)
	_set_highscore()
	var file = FileAccess.open("user://highscore.txt", FileAccess.WRITE)
	file.store_string("%s" % GlobalHighscore.highscore)
	
func _set_highscore():
	if GlobalHighscore.highscore < GlobalScore.score:
		GlobalHighscore.highscore = GlobalScore.score
		set_new_highscore()
		
func load_highscore():
#	var file = FileAccess.open("user://highscore.txt", FileAccess.READ)
#	highscore = file.get_as_text(true).to_int()
#	_set_highscore()
	if FileAccess.file_exists("user://highscore.txt"):
		var file = FileAccess.open("user://highscore.txt", FileAccess.READ)
		GlobalHighscore.highscore = file.get_as_text(true).to_int()
		_set_highscore()
	else:
		print("no data saved..")


