extends CharacterBody3D
const SPEED = 3.0
const JUMP_VELOCITY = 7
const MAX_JUMP:int=2

var save_path := "user://variable.save"

@onready var player_health = GlobalPlayer.Player_Status
@onready var damageHud = $Camera3D/damageHud
@onready var animation_pain = $Camera3D/damageHud
var DAMAGE:int = 1
var no_health
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var collider_disabled = false


func _on_ready():
	#$"../Lobby_sound".play()
	pass
func hit_animation():
	damageHud.show()
	$Camera3D/cameraShake.play("weakShake")
	collider_disabled = true
	await get_tree().create_timer(0.280).timeout
	collider_disabled = false
	print_debug("hit animation")
	damageHud.hide()
func _physics_process(delta):
	if collider_disabled:
		return
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept"):
		$jumpAudio.play()
		velocity.y = JUMP_VELOCITY
	# Jump mechanics
	var input_dir = Input.get_vector("right", "left", "backward", "forward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)     
		velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()
	var min_position = Vector3(5, 0.2, -1000)
	var max_position = Vector3(6, 2.5, 1000)
	
	global_position = global_position.clamp(min_position, max_position)
	# game over	
	await get_tree().create_timer(3.5).timeout #upstart
	#optional! can put flashy lights effects
	#to fix early collission on the start of the game
	var collision = get_last_slide_collision()
	if collision:
		if !collider_disabled:
			#optional: this can be improved with animation or shake
			$damageAudio.play()
			hit_animation()
			player_health -= 1
			no_health = player_health
			print_debug("remaining health: ", no_health)
			if no_health == 0:
				print("Gameover!")
				get_tree().change_scene_to_file("res://scenes/Gameover.tscn")# gameover func
#				print("Collided with: ", collision.get_collider())
				print_debug("your last score from ship.script: ", GlobalHighScore.score)
# some buttons
func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/control.tscan")
	
#func _on_save_score(): #first solution
#	if GlobalHighScore.score > SaveLoad.highest_record :
#		SaveLoad.highest_record = GlobalHighScore.score
#		$score.text = str(GlobalHighScore.score)
#		print_debug("saved score")
#	SaveLoad.save_score()
	
func _on_left_pressed():
	var left_direction = -transform.basis.x
	left_direction = left_direction.normalized()
	velocity = left_direction * SPEED
	print("pressed for left")
#func _on_play_pressed() -> void:
	#var min_position = Vector3(-5, 0.2, -1000)
	#var max_position = Vector3(5, 10, 1000)
	#global_position = global_position.clamp(min_position, max_position)
func _on_rightt_pressed() -> void:
	print("pressed for right")
	await get_tree().create_timer(1.2).timeout
	
var jump :int=0 	#the the default value
var jump_value :int=1	#the value to be added

func _on_less_jump():
#	if int(jump) < int(MAX_JUMP):
	print_debug("jumped!")
	print("used jump: ", jump)
	$jumpAudio.play()
	velocity.y = JUMP_VELOCITY
	await get_tree().create_timer(1.2).timeout
	jump=0
func _on_more_jump(): # not implemented
#	if int(jump) > int(MAX_JUMP):
	await get_tree().create_timer(4.5).timeout
	print_debug("max jump exceeded!")
	print("exceeded jump: ", jump)
	jump = 0
func _on_jump_pressed() -> void:	
	jump = jump + jump_value	#the equation
	if int(jump) < int(MAX_JUMP):
		_on_less_jump()
func _on_timer_timeout() -> void:
	print_debug("invisibility is off!")
# save
func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(GlobalHighScore.score)
	
func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		GlobalHighScore.score = file.get_var(GlobalHighScore.score)	
	else:
		print("no data saved..")
