extends Node3D

@onready var  HUD = $CanvasLayer/HUD

var score :int=0:
	set(value):
		score = value
		HUD.score = score
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#$main.play()
	HUD.score = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_menu_released() -> void:
	$shipPlayer/menuAudio.play()
	get_tree().change_scene_to_file("res://scenes/control.tscn")


func _on_jump_pressed() -> void:
	pass # Replace with function body.
func _score(points):
	score += 1
	print(score)
