extends Node3D

@onready var level = $"../"
var baseSpeed = 0.025
var maxSpeed = 10
var speedIncrement = 1.5
var speed = baseSpeed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# acceleration
	speed += speedIncrement *delta
	#clamping
	speed = min(speed, maxSpeed)
	
	position.x -= speed * delta
	if position.x < -7:
		level.spawnModule(position.x+(level.amnt*level.offset))
		queue_free()
