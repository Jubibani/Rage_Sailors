extends Node3D

@onready var  HUD = $HUD

var upstart_time:int= 3.5
var done_time:int=0
var score :int=0:
	set(value):
		score = value
		HUD.score = score
# Called when the node enters the scene tree for the first time.
func _upstart() -> void:
	$splashSound.play()
	$mainBackgroundSound.play()
	while done_time < upstart_time:
		done_time = done_time + 1
		await get_tree().create_timer(0.3).timeout
		$"shipPlayer".hide()
		print_debug("done_time: ", upstart_time)
		await get_tree().create_timer(0.3).timeout
		$"shipPlayer".show()
		print_debug("done_time: ", upstart_time)
		await get_tree().create_timer(0.3).timeout
		print_debug("done_time: ", upstart_time)
		if done_time == 3:
			print_debug("done_time: ", upstart_time)
			$"shipPlayer".show()	
		
func _ready() -> void:
	#$main.play()
	$CanvasLayer/PauseUnpause/PauseTimer.start()
	GlobalHighScore.score_collected.emit()
	process_mode = Node.PROCESS_MODE_PAUSABLE
	_upstart()
	#$shipPlayer.hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_menu_released() -> void:
	$shipPlayer/menuAudio.play() # this is for the audio button
	get_tree().paused = true
	$"CanvasLayer/PauseUnpause".show()
	$huhAudio.play()
	
	
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
	GlobalHighScore.score_collected.emit()
	print_debug("score_gained!")


func _on_timer_timeout() -> void:
	$shipPlayer.show()
