extends RigidBody3D

@export var move_force: float = 10.0
var current_move_force: float = 10.0
@export var max_ang_speed: float = 50.0
@export var boost_multiple: float = 3.0
var camera_3d : Camera3D
@export var jump_force: float = 5.0

func _ready():
	camera_3d = get_tree().current_scene.get_node("Camera3D")
	angular_damp = 1.5

func _process(_delta):
	pass

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("Boost"):
		current_move_force *= boost_multiple
	if Input.is_action_pressed("Forward"):
		apply_torque(camera_3d.global_basis * Vector3(-1, 0, 0) * current_move_force)
	if Input.is_action_pressed("Backward"):
		apply_torque(camera_3d.global_basis * Vector3(1, 0, 0) * current_move_force)
	if Input.is_action_pressed("Right"):
		apply_torque(camera_3d.global_basis * Vector3(0, 0, -1) * current_move_force)
	if Input.is_action_pressed("Left"):
		apply_torque(camera_3d.global_basis * Vector3(0, 0, 1) * current_move_force)
	if Input.is_action_pressed("Jump"):
		# check if touching the floor (or really any CSGBox3D)
		var bodies = get_colliding_bodies()
		for body in bodies:
			if body is CSGBox3D:
				apply_impulse(Vector3(0, 1, 0) * jump_force)
	current_move_force = move_force # reset current_move_force back to original move_force after boosting

	# clamp rotational velocity
	if angular_velocity.length() > max_ang_speed:
		angular_velocity = angular_velocity.normalized() * max_ang_speed

func _exit_tree() -> void:
	pass
