extends CharacterBody3D
const SPEED = 5.0
const JUMP_VELOCITY = 7
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var collider_disabled = false
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


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
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
	var max_position = Vector3(6, 10, 1000)
	global_position = global_position.clamp(min_position, max_position)
	# game over	
	var collision = get_last_slide_collision()
	if collision:
		if !collider_disabled:
			print("Collided with: ", collision.get_collider())
			#get_tree().change_scene_to_file("res://scenes/Gameover.tscn")# gameover func
# some buttons
func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/control.tscan")

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
