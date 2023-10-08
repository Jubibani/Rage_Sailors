extends Node3D

@onready var  HUD = $CanvasLayer/HUD

var score :int=0:
	set(value):
		score = value
		HUD.score = score
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#$main.play()
#	HUD.score = 0
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_menu_released() -> void:
	$shipPlayer/menuAudio.play()
	get_tree().paused = true
	$"CanvasLayer/PauseUnpause".show()
	
func _score(points):
	score += points
	HUD.score = score
	print(score)
#func pause(): 
#	get_tree().paused = true
#	$PauseMenu.show()
#func unpause():
#	get_tree().paused = false
#	$PauseMenu.hide()
