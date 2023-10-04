extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$main.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_menu_released() -> void:
	$shipPlayer/menuAudio.play()
	get_tree().change_scene_to_file("res://scenes/control.tscn")
