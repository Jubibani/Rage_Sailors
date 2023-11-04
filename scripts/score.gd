extends Label


var score:int = 0:
	set (mod_value):
		score = mod_value
		text = str(score)

func _ready() -> void:
	$".".text = str(GlobalHighScore.score_collected.connect(_on_score_collected))
	var save_nodes = get_tree().get_nodes_in_group("Persist")


func _process(delta: float) -> void:
	process_mode = Node.PROCESS_MODE_PAUSABLE
	
func _on_score_collected() -> void:
#	#save config file for the score
#	var last_score_config = ConfigFile.new()
#	#storing for the value
#	last_score_config.set_value("your last score: ", )
#
#	# saving the file
#	last_score_config.save("user://scores.cfg")
	var last_score:int=0
	while GlobalHighScore.score < 100000000: #a temporary fix
		last_score = GlobalHighScore.score
		await get_tree().create_timer(1.3, false).timeout
		save()
		print_debug("last_score_saved")
		# 'false' what is a couroutine?
		score = score + 1
		print_debug("score: ", score)
		if GlobalHighScore.score >  100000000 :
			print_debug("you're the king of the pirates!")
		if GlobalPlayer.Player_Status == 0:
			await get_tree().create_timer(10.0, false).timeout
			print_debug("score: ", score) # last score_count
			print_debug("last_score_printed: ", last_score) #getting the last score
	#getting last score value
#	print_debug("last_score_printed: ", last_score)
		
func save():
	var save_dict = {
		"filename" : get_scene_file_path(),
		"last_score" : GlobalHighScore.score
	}
	return save_dict
func load():
	pass
	
func _on_timer_timeout():
	pass

