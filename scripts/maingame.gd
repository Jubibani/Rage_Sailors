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
	get_tree().change_scene_to_file("res://scenes/control.tscn")
	
func _score(points):
	score += points
	HUD.score = score
	print(score)
