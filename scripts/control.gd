extends Control
@onready var highscore = GlobalHighscore.highscore
@onready var score = GlobalScore.score
@onready var buttonAudio = $ColorRect/buttonAudio
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HUDScoreCoins.hide()
	#GlobalMusic.play()
	#GlobalLobbyAudio.play()
#	_set_highscore()
#	$ColorRect/score_x.text = str(GlobalScore.score)
	player_score()
	load_highscore()
#	var file = File.new()
#	if file.file_exists("user://high-score.txt"):
#		file.open("user://high-score.txt", File.READ)
#		var content = file.get_as_text(true)
#		if content.is_valid_integer():
#			highscore = content.to_int()
#		else:
#			print("Error: Invalid highscore value.")
#		file.close()
#	else:
#		print("Error: Highscore file not found.")
#
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func player_score():
	highscore = score
	$ColorRect/score_x.text = str(GlobalHighscore.highscore)
	$ColorRect/score_x.text = str(GlobalScore.score)
	_set_highscore()
	
func set_new_highscore():
	GlobalHighscore.highscore = GlobalScore.score
	_set_highscore()
	var file = FileAccess.open("user://high-score.txt", FileAccess.WRITE)
	file.store_string(highscore)
	
func _set_highscore():
	if GlobalHighscore.highscore < GlobalScore.score:
		GlobalHighscore.highscore = GlobalScore.score
		$ColorRect/Highescore_x.text = str(GlobalHighscore.highscore)
		
#func load_highscore():
#	var file = FileAccess.open("user://high-score.txt", FileAccess.READ)
##	highscore = file.get_as_text(true).to_int()
#	highscore = file.get_var(10)	
#	_set_highscore()
#
#
#func _idle_highscore():
#		if GlobalHighscore.highscore > GlobalScore.score:
#		GlobalHighscore.highscore = GlobalScore.score
#		$ColorRect/Highescore_x.text = str(GlobalHighscore.highscore)
	
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
