extends Node

var currentScore = 0
var highScore = 0
var scoringEnabled = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if scoringEnabled:
		currentScore += delta * 10
		
func updateScoreLabel():
	$Label.text = "Score: " + str(currentScore) + "\nHigh Score: " + str(highScore)

func gameOver():
	scoringEnabled = false
	if currentScore > highScore:
		highScore = currentScore
	updateScoreLabel()
