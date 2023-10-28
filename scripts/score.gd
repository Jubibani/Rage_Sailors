extends Label

var score:int = 0:
	set (mod_value):
		score = mod_value
		text = str(score)

func _ready() -> void:
	$".".text=str(GlobalHighScore.score_collected.connect(_on_score_collected))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_score_collected() -> void:
#	while Global_Coin.PlayerStatus:
#		await get_tree().create_timer(1.5).timeout
#		score = score + 1
#		print_debug("score: ", score)
	pass


func _on_timer_timeout():
	pass # Replace with function body.
