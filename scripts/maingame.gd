extends Node3D

#@onready var HUD = $HUD
var upstart_time:float= 3.5
var done_time:int=0
var score :int=0:
	set(value):
		score = value
		score = GlobalScore.score
		
func _upstart() -> void:
	$splashSound.play()
	$mainBackgroundSound.play()
	while done_time < upstart_time:
		done_time = done_time + 1
		await get_tree().create_timer(0.3).timeout
		$"shipPlayer".hide()
		await get_tree().create_timer(0.3).timeout
		$"shipPlayer".show()
		await get_tree().create_timer(0.3).timeout
		if done_time == 3:
			$"shipPlayer".show()	
			
func _ready() -> void:
	$CanvasLayer/PauseUnpause/PauseTimer.start() #upstart
	GlobalScore.score_collected.emit()
	process_mode = Node.PROCESS_MODE_PAUSABLE
	_upstart()
	
func _process(delta: float) -> void:
	pass
	
func _reset_score(): #my previous fix to reset the score system and display 0  when menu is pressed
	GlobalHighscore.highscore = 0
	GlobalScore.score = 0
	print("resetglobal_highscore: ", GlobalHighscore.highscore)
	print("resetglobal_score: ", GlobalScore.score)
	
	
func _on_menu_released() -> void:
	$shipPlayer/menuAudio.play() # this is for the audio button
	get_tree().paused = true
	$"CanvasLayer/PauseUnpause".show()
	$huhAudio.play()
	_reset_score()
	
func _on_continue_released():
	print("pressed continue")
	$"CanvasLayer/PauseUnpause".hide() #hide the buttons
	print("start timer")
	$"CanvasLayer/Countdown/3".show()
	await get_tree().create_timer(1.5).timeout
	$"CanvasLayer/Countdown/3".hide()
	$"CanvasLayer/Countdown/2".show()
	await get_tree().create_timer(1.5).timeout
	$"CanvasLayer/Countdown/2".hide()
	$"CanvasLayer/Countdown/1".show()
	await get_tree().create_timer(1.5).timeout
	$"CanvasLayer/Countdown/1".hide()
	print("timer ended")
	get_tree().paused = false #execute unpause

	
func _score_collected(body: Node3D) -> void:
	GlobalScore.score_collected.emit()
	print_debug("score_gained!")

func _on_timer_timeout() -> void:
	$shipPlayer.show()

#save function
