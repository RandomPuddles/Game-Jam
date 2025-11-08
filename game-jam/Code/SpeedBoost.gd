# SpeedBoost.gd 
extends Area3D

@export var mode := "speedBoost"   
@export var bouncePower := 5.0      # speed boost strength

# return type void
func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(enteredBody: Node) -> void:
	if not enteredBody is RigidBody3D:
		return

	var _normal: Vector3 = global_transform.basis.y.normalized()
	if enteredBody is RigidBody3D:
		if mode == "speedBoost":
			var currentVelocity: Vector3 = enteredBody.linear_velocity
			enteredBody.apply_central_impulse(currentVelocity)
		# if mode  is bouncy it gets the current velocity of whatever enters it.
		# this is supposed to switch the velocity around???
		#var reflected: Vector3 = currentVelocity - 2.0 * currentVelocity.dot(normal) * normal
		# so it supposed to revereser the vector and then set the linear velocity
		# to the bounce power and the reversed/reflected number
		#enteredBody.linear_velocity = reflected * bouncePower
		# and boom fake jump!
	#else: # launcher
		## this one is supposed to just boost the linear velocity to make the jumps better?
		#enteredBody.linear_velocity = normal * bouncePower
