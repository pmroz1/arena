extends Node3D

# Reference to the gun's mesh (if you want to hide/show or animate)
@export var gun_mesh: MeshInstance3D

func _process(delta):
	# The gun naturally follows the camera since it's a child of the Camera3D node.
	# Additional logic for shooting, animations, etc., can go here.
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	# Implement shooting logic, like spawning bullets or playing animations.
	print("Bang!")
