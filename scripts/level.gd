extends Node3D

@export var modules: Array[PackedScene] = []
var amnt = 500
var rng = RandomNumberGenerator.new()
var offset = 6
var speed = 5  # Initial speed
var maxSpeed = 10  # Maximum speed
var distanceTraveled = 0  # Variable to track distance traveled

# Called when the node enters the scene tree for the first time.
func _ready():
	for n in amnt:
		spawnModule(n * offset)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Update the distance traveled based on the current speed
	distanceTraveled += speed * delta

	# Increase the speed gradually up to the maximum speed
	if speed < maxSpeed:
		speed += 0.1 * delta  # Adjust the rate of speed increase as needed

	pass

func spawnModule(n):
	rng.randomize()
	var num = rng.randi_range(0, modules.size() - 1)
	var instance = modules[num].instantiate()
	instance.position.x = n
	add_child(instance)
