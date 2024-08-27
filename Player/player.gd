extends CharacterBody3D

# Movement parameters
var speed = 10.0
var run_speed_multiplier = 1.5
var jump_velocity = 4.5
var sensitivity = 0.003

# Physics
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

# State
var is_running = false

func _ready():
	# Capture the mouse
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		# Rotate the player horizontally and the camera vertically
		rotate_y(-event.relative.x * sensitivity)
		$Camera.rotate_x(-event.relative.y * sensitivity)
		# Clamp camera rotation to avoid flipping
		$Camera.rotation.x = clamp($Camera.rotation.x, -PI/2, PI/2)
	
	if event.is_action_pressed("ui_cancel"):
		# Free the mouse
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	if event.is_action_pressed("run"):
		is_running = true
	elif event.is_action_released("run"):
		is_running = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		if Input.is_action_just_pressed("jump"):
			velocity.y = jump_velocity

	# Handle movement
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	# Adjust speed based on running state
	var current_speed = speed * (run_speed_multiplier if is_running else 1.0)
	
	if direction:
		velocity.x = direction.x * current_speed
		velocity.z = direction.z * current_speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()
