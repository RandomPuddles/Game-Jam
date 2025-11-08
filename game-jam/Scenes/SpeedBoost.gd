# SpeedBoost.gd 
extends Area3D

@export var mode := "speedBoost"   
@export var bouncePower := 2.0      # speed boost strength

# return type void
func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(enteredBody: Node) -> void:
	if not enteredBody is RigidBody3D:
		return

	var normal: Vector3 = global_transform.basis.y.normalized()

	if mode == "speedBoost":
		# if mode  is bouncy it gets the current velocity of whatever enters it.
		var currentVelocity: Vector3 = enteredBody.linear_velocity
		# this is supposed to switch the velocity around???
		var reflected: Vector3 = currentVelocity - 2.0 * currentVelocity.dot(normal) * normal
		# so it supposed to revereser the vector and then set the linear velocity
		# to the bounce power and the reversed/reflected number
		enteredBody.linear_velocity = reflected * bouncePower
		# and boom fake jump!
	else: # launcher
		# this one is supposed to just boost the linear velocity to make the jumps better?
		enteredBody.linear_velocity = normal * bouncePower
