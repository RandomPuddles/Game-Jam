extends RigidBody3D

@export var move_force: float = 10.0
var current_move_force: float = 10.0
@export var max_ang_speed: float = 50.0
var camera_3d : Camera3D
@export var jump_force: float = 1.0
@export var normal_friction: float = 3.15
@export var ice_friction: float = 0.30
@export var normal_bounce: float = 0.0
@export var bounce: float = 20.0
var boost_charge: float = 1
@export var boost_charge_max: float = 1.2
var boosting: bool = false

func _ready():
	camera_3d = get_tree().current_scene.get_node("Camera3D")
	angular_damp = 1.5

func _process(_delta):
	pass

func _physics_process(_delta: float) -> void:
	# progressively slow time while pressing the Boost buttonsaa
	if Input.is_action_pressed("Boost"):
		boost_charge += 0.1
		if boost_charge > boost_charge_max:
			boost_charge = boost_charge_max
		if Engine.time_scale > 0:
			Engine.time_scale -= 0.05
			if Engine.time_scale < 0.0:
				Engine.time_scale = 0.0
	# resume time and boost when the Boost button is released
	if Input.is_action_just_released("Boost"):
		Engine.time_scale = 1
		current_move_force *= boost_charge
		boost_charge = 1
		var movement_direction = linear_velocity
		if movement_direction.length() > 0.01:
			movement_direction = movement_direction.normalized()
			apply_central_impulse(movement_direction * current_move_force)
			boosting = true
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
			if body is CSGShape3D:
				apply_impulse(Vector3(0, 1, 0) * jump_force)
	if boosting: # allow boost to apply for a frame
		boosting = false
	else: # reset current_move_force after a frame of boosting
		current_move_force = move_force # reset current_move_force back to original move_force after boosting
	
	# clamp rotational velocity
	if angular_velocity.length() > max_ang_speed:
		angular_velocity = angular_velocity.normalized() * max_ang_speed
	
	if Input.is_action_pressed("Restart"):
		get_tree().reload_current_scene()

func _exit_tree() -> void:
	pass
