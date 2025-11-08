extends RigidBody3D

@export var move_force: float = 10.0
var current_move_force: float = 10.0
@export var max_ang_speed: float = 50.0
@export var boost_multiple: float = 3.0
var camera_3d : Camera3D
@export var jump_force: float = 5.0
@export var normal_friction: float = 3.15
@export var ice_friction: float = 0.30
@export var normal_bounce: float = 0.0
@export var bounce: float = 20.0

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
	
	# lower friction if on object in group "Ice"
	var on_ice: bool = false
	var bodies2 = get_colliding_bodies()
	for body in bodies2:
		if body.is_in_group("Ice"):
			on_ice = true
	if on_ice:
		physics_material_override.friction = ice_friction
	else:
		physics_material_override.friction = normal_friction

func _exit_tree() -> void:
	pass
