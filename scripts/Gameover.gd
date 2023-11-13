extends Control

var highscore:int=0
@onready var score = GlobalScore.score

var save_path := "user://variable.save"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HUDScoreCoins.hide()
#	GlobalHighScore.score_collected.emit() #if on: score goes back to 0 then increment
	$yousuckAudio.play()
	$ColorRect/Highescore_x.text = str(GlobalScore.score)
	$ColorRect/score_x.text = str(GlobalScore.score)
	
	load_high_score()
	print("from main: ", GlobalScore.score) # this works
	
	# commentator
	if GlobalScore.score <= 5:
		$"ColorRect/you suck_shadow".show()
		$"ColorRect/you suck".show()
	if GlobalScore.score > 5:
		$ColorRect/boullets_shadow.show()
		$ColorRect/boullets.show()
		$ColorRect/boullets_white.show()
		
#func last_score_collected():
#	print_debug("last_score_printed: ", GlobalScore.score)

func set_high_score():
	if highscore < GlobalScore.score:
		highscore = GlobalScore.score
		save_high_score()
		
func save_high_score():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(GlobalScore.score)
	
func load_high_score():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		GlobalScore.score = file.get_var(GlobalScore.score)	
	else:
		print("no data saved..")
		
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
