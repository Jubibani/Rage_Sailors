extends Label


var coins:int = 0:
	set (mod_value):
		coins = mod_value
		text = str(coins)


func _ready() -> void:
	Global_Coin.coin_collected.connect(_on_coin_collected)
	# coins = 0


func _on_coin_collected() -> void:
	coins = coins + 1
