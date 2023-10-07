extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_skins_pressed() -> void:
	$buttonAudio.play()


func _on_start_pressed() -> void:
	$buttonAudio.play()


func _on_maps_pressed() -> void:
	$buttonAudio.play()


func _on_options_pressed() -> void:
	$buttonAudio.play()
	
# from overvation: The node ButtonAudio properties is set to "autoplay" That is why there
# is a sound after button click not because of the func you set but because of auto play.
# so therefore, your code needs mmore polishing and checking.
