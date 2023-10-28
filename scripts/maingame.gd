extends Node3D

@onready var  HUD = $CanvasLayer/HUD

var score :int=0:
	set(value):
		score = value
		HUD.score = score
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#$main.play()
	$CanvasLayer/PauseUnpause/PauseTimer.start()
	GlobalHighScore.score_collected.emit()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_menu_released() -> void:
	$shipPlayer/menuAudio.play() # this is for the audio button
	get_tree().paused = true
	$"CanvasLayer/PauseUnpause".show()
	
	
func _on_continue_released():
	print("pressed continue")
	$"CanvasLayer/PauseUnpause".hide() #hide the buttons
	print("start timer")
	$"CanvasLayer/Countdown/3".show()
	#$"CanvasLayer/PauseUnpause/3".show()
	await get_tree().create_timer(1.5).timeout
	$"CanvasLayer/Countdown/3".hide()
	#$"CanvasLayer/PauseUnpause/3".hide()
	$"CanvasLayer/Countdown/2".show()
	await get_tree().create_timer(1.5).timeout
	$"CanvasLayer/Countdown/2".hide()
	#$"CanvasLayer/PauseUnpause/2".hide()
	$"CanvasLayer/Countdown/1".show()
	#$"CanvasLayer/PauseUnpause/1".show()
	await get_tree().create_timer(1.5).timeout
	$"CanvasLayer/Countdown/1".hide()
	#$"CanvasLayer/PauseUnpause/1".hide()
	print("timer ended")
	get_tree().paused = false #execute unpause
	
func _score_collected(body: Node3D) -> void:
	GlobalHighScore.score_collected.emit()
	print_debug("score_gained!")
