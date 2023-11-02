extends Node

@onready var Sprite2d = $Sprite2D
@onready var x = $x
@onready var CollectedCoins = $CollectedCoins
@onready var score = $score
@onready var Highscore = $Highscore


func _on_menu_pause_released() -> void:
	get_tree().paused = true
	$"../CanvasLayer/PauseUnpause".show()
