extends CharacterBody3D

# Speed settings
const WALK_SPEED = 5.0
const SPRINT_SPEED = 8.0
const JUMP_VELOCITY = 4.5
const SENSITIVITY = 0.01

var speed = WALK_SPEED  

# Head bobbing
const BOB_FREQ = 2.4
const BOB_AMP = 0.08
var t_bob = 0.0

# Field of View (FOV) settings
const BASE_FOV = 75.0
const FOV_CHANGE = 1.6

# Gravity
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

# Node references
@onready var head = $Head
@onready var camera = $Head/Camera3D
@onready var animation_player = $AnimationPlayer

# Camera rotation limits
const camera_down_deg_limit = -80
const camera_up_deg_limit = 80

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * SENSITIVITY)
		camera.rotate_x(-event.relative.y * SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(camera_down_deg_limit), deg_to_rad(camera_up_deg_limit))

func _physics_process(delta):
	# Add gravity
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		_play_animation("Jump")

	# Determine movement speed
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction = (head.transform.basis * Vector3(input_dir.x, 0.0, input_dir.y)).normalized()
	
	if direction != Vector3.ZERO:
		if Input.is_action_pressed("sprint"):
			speed = SPRINT_SPEED
			_play_animation("Sprint")  # Assuming "Sprint" animation exists
		else:
			speed = WALK_SPEED
			_play_animation("Walk")
	else:
		_play_animation("Idle")

	# Apply movement
	if is_on_floor():
		if direction:
			velocity.x = direction.x * speed
			velocity.z = direction.z * speed
		else:
			velocity.x = lerp(velocity.x, 0.0, delta * 7.0)
			velocity.z = lerp(velocity.z, 0.0, delta * 7.0)
	else:
		velocity.x = lerp(velocity.x, 0.0, delta * 3.0)
		velocity.z = lerp(velocity.z, 0.0, delta * 3.0)

	# Apply head bobbing effect
	t_bob += delta * velocity.length() * float(is_on_floor())
	camera.transform.origin = _headbob(t_bob)
	
	# Adjust FOV based on speed
	var velocity_clamped = clamp(velocity.length(), 8.5, SPRINT_SPEED * 2)
	var target_fov = BASE_FOV + FOV_CHANGE * (velocity_clamped / SPRINT_SPEED)
	camera.fov = lerp(camera.fov, target_fov, delta * 8.0)
	
	move_and_slide()

func _headbob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * BOB_FREQ) * BOB_AMP
	pos.x = sin(time * BOB_FREQ / 2) * BOB_AMP
	return pos

func _play_animation(animation_name: String) -> void:
	if not animation_player.is_playing() or animation_player.current_animation != animation_name:
		animation_player.play(animation_name)
