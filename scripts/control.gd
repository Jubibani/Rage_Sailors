extends Control
#	save function (highscore)
@onready var highscore = GlobalHighscore.highscore
@onready var score = GlobalScore.score
@onready var buttonAudio = $ColorRect/buttonAudio

var save_path := "user://variable.save"

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
