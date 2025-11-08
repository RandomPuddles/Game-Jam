extends RigidBody3D
@onready var camera_3d: Camera3D = $"../Camera3D"

var move_force :float = 10.0
var max_ang_speed :float = 50.0

func _ready():
	angular_damp = 1.5

func _process(_delta):
	pass

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("Forward"):
		apply_torque(camera_3d.global_basis * Vector3(-1, 0, 0) * move_force)
	if Input.is_action_pressed("Backward"):
		apply_torque(camera_3d.global_basis * Vector3(1, 0, 0) * move_force)
	if Input.is_action_pressed("Right"):
		apply_torque(camera_3d.global_basis * Vector3(0, 0, -1) * move_force)
	if Input.is_action_pressed("Left"):
		apply_torque(camera_3d.global_basis * Vector3(0, 0, 1) * move_force)

	# clamp rotational velocity
	if angular_velocity.length() > max_ang_speed:
		angular_velocity = angular_velocity.normalized() * max_ang_speed

func _exit_tree() -> void:
	pass
