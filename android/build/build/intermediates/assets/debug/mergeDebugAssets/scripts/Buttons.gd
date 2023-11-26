extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_left_pressed() -> void:
	Input.action_press("left")

func _on_left_released() -> void:
	Input.action_release("left")


func _on_right_pressed() -> void:
	Input.action_press("right")

func _on_right_released() -> void:
	Input.action_release("right")
