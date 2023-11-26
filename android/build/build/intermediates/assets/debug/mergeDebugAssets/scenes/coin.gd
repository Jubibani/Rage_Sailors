#extends Area3D
#
#
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
#	#var global_script = load("res://scripts/GlobalScript.gd")
#	Global_Coin.emit_signal("_on_body_entered", self, "_on_body_entered")
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	rotate_y(deg_to_rad(2))
#
#func collectCoin():
#	print("collected a coin!")
#	GlobalScript.emit_signal("collectCoin", self)
#
#	queue_free()
