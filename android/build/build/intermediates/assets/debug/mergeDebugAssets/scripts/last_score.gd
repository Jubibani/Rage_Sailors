extends Label


var score:int = 0:
	set (mod_value):
		score = mod_value
		text = str(score)
		
var last_score:int=0
		
func _ready() -> void:
	$".".text = str(GlobalScore.score_collected.connect(_on_label_score_collected))
#	$".".text = str(GlobalHighScore.score_collected.connect(_on_last_score))
	GlobalScore.score_collected.emit()
	

func _process(delta: float) -> void:
	process_mode = Node.PROCESS_MODE_PAUSABLE
	
func _on_label_score_collected() -> void:			
	print_debug("last_score_printed: ", last_score) #getting the last score
func _on_last_score() -> void:
	print_debug("last_score_printed: ", last_score)
	
func _on_timer_timeout():
	pass

