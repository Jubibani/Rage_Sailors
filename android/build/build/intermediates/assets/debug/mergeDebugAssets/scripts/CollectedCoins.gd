extends Label


var coins:int = 0:
	set (mod_value):
		coins = mod_value
		text = str(coins)


func _ready() -> void:
	$".".text = str(Global_Coin.coin_collected.connect(_on_coin_collected))
	#global coin == global script
	#coin_collected is the function of the collission
	#_on coin_collected?

func _on_coin_collected() -> void:
	coins = coins + 1
