extends Area3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#var global_script = load("res://scripts/GlobalScript.gd")
	#Global_Coin.("_on_body_entered", self, "_on_body_entered")
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotate_y(deg_to_rad(2))


#	print("collected")
#	GlobalScript.emit_signal("collectCoin")
#	queue_free()


func _on_body_entered(body: Node3D) -> void:
	print("collected")
	GlobalScript.collectCoin
