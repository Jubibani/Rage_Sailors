extends Label


var HighRecord = HighestRecord.record
var last = GlobalHighScore.score
var score:int = 0:
	set (mod_value):
		score = mod_value
		text = str(score)
var last_score

func _ready() -> void:
	$".".text = str(GlobalHighScore.score_collected.connect(_on_score_collected))


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
	
	while score < 100000000: #a temporary fix
		last_score = score
		await get_tree().create_timer(1.5, false).timeout
		# 'false' what is a couroutine?
		score = score + 1
		GlobalHighScore.score = last_score
		print_debug("score: ", last_score)
		if score >  100000000 :
			print_debug("you're the king of the pirates!", last_score)
		if GlobalPlayer.Player_Status == 5:
			await get_tree().create_timer(1.5,).timeout
			print_debug("last_score_printed: ", last_score) #getting the last score
			if GlobalPlayer.Player_Status == 0:
				await get_tree().create_timer(10.0, false).timeout
	print_debug("GlobalHighscore.score: ", GlobalHighScore.score)
	HighRecord = last_score
	print_debug("HighRecord | last_score", last_score)
func my_score():
	print_debug("last_score_printed: ", last_score) 
