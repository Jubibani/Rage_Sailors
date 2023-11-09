extends Label


var score:int = 0:
	set (mod_value):
		score = mod_value
		text = str(score)
var last_score:int=0
func _ready() -> void:
#	$".".text = str(GlobalHighScore.score_collected.connect(_on_score_collected))
	$".".text = str(GlobalHighScore.score_collected.connect(_on_last_score))
	

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
			print_debug("score: ", score) # last score_count

func _on_last_score() -> void:
	var last_score:int=0
	last_score = score
	print_debug("last_score_printed: ", last_score)
	
func _on_timer_timeout():
	pass
