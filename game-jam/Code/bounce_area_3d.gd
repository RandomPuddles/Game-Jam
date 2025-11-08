extends Area3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _physics_process(_delta: float) -> void:
	pass

func _on_body_entered(body: Node3D):
	body.physics_material_override.bounce = 20

func _on_body_exited(body: Node3D):
	body.physics_material_override.bounce = 0
