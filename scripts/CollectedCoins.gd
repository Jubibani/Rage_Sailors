extends Label


var coins = 0

func _ready() -> void:
#	var global_script = load("res://scripts/GlobalScript.gd")
#	#global_script.emit_signal("_on_body_entered", self, "_on_body_entered")
	#GlobalScript.connect("collectCoin", self, "collectCoin")
	text = str(coins)
	
#func collectCoin():
#	coins += 1
#	emit_signal("coinCollected", coins)

func _on_body_entered() -> void:
	coins = coins + 1
	connect("body_entered", GlobalScript.coin)
	_ready()
#func collecCoin():
#	coins = coins + 1
#	GlobalScript.coin
#	_ready()
	

