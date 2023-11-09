extends Area3D

func _process(delta: float) -> void:
	rotate_y(deg_to_rad(2))

func _coin_collected(body: Node3D) -> void:
	# refer to score text
	prints("collected")
	Global_Coin.coin_collected.emit()
	$"../coinAudio".play()
	queue_free()
	
