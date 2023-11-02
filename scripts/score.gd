extends Label


var score:int = 0:
	set (mod_value):
		score = mod_value
		text = str(score)
var goal:int = 100000000

func _ready() -> void:
	$".".text = str(GlobalHighScore.score_collected.connect(_on_score_collected))
	process_mode = Node.PROCESS_MODE_PAUSABLE
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_score_collected() -> void:
	while GlobalHighScore.score < goal: #a temporary fix
		await get_tree().create_timer(1.3).timeout
		score = score + 1
		print_debug("score: ", score)
		if GlobalHighScore.score <=  goal :
			print_debug("you're the king of the pirates!")
		

func _on_timer_timeout():
	pass
