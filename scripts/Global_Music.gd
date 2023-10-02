extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	preload("res://sounds/main menu .mp3")
	stream = load("res://sounds/main menu .mp3")
	play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
