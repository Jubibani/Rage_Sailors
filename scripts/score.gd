extends Label


var score:int = 0:
	set (mod_value):
		score = mod_value
		text = str(score)

func _ready() -> void:
	$".".text = str(GlobalHighScore.score_collected.connect(_on_score_collected))
	

func _process(delta: float) -> void:
	process_mode = Node.PROCESS_MODE_PAUSABLE
	
func _on_score_collected() -> void:
	while GlobalHighScore.score < 100000000: #a temporary fix
		await get_tree().create_timer(1.3, false).timeout
		# 'false' what is a couroutine?
		score = score + 1
		print_debug("score: ", score)
		if GlobalHighScore.score >  100000000 :
			print_debug("you're the king of the pirates!")
		if GlobalPlayer.Player_Status == 0:
			print_debug("score: ", score)
			get_line_count()
		

func _on_timer_timeout():
	pass

