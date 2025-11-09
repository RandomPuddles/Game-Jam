extends Node2D

@export var marblePort: Sprite2D
@export var plat1: Sprite2D
@export var plat1p2: Sprite2D
@export var plat2: Sprite2D
@export var plat3: Sprite2D
@export var plat4: Sprite2D
@export var plat5: Sprite2D
@export var wall1: Sprite2D
@export var scene3D: Node3D
var cam3D: Camera3D
var marb: Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	cam3D = scene3D.get_child(0)
	marb = scene3D.get_child(1).get_child(0)
	marblePort = get_node("CanvasGroupSprites/Sprite2DViewport")
	plat1 = get_node("CanvasGroupSprites/plat1")
	plat1p2 = get_node("CanvasGroupSprites/plat1p2")
	plat2 = get_node("CanvasGroupSprites/plat2")
	plat3 = get_node("CanvasGroupSprites/plat3")
	plat4 = get_node("CanvasGroupSprites/plat4")
	plat5 = get_node("CanvasGroupSprites/plat5")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:

	#marbCoord = cam3D.unproject_position(marb.position)
	#marbCoordBtoom = marbCoord.y + marbHeight
	
	if is_below_plat1():
		marblePort.z_index = plat1.z_index - 1
	elif is_below_plat1p2():
		marblePort.z_index = plat1p2.z_index - 1
	pass
	
	
	#if (marb.global_position.y < 0) && ((marb.global_position.x >= 6.5) || (marb.global_position.z <= -6.5)):
	#	bg.z_index = 2
	#else:
	#	bg.z_index = 0
	#pass

func is_below_plat1()->bool:
	# -28.4, 1.809, -10.5
	if (marb.global_position.y < 1.809 \
	and (marb.global_position.x <= -28.4 \
	or marb.global_position.z <= -10.5)):
		return true
	else:
		return false
		
func is_below_plat1p2()->bool:
	# -28.4, 1.809, -10.5
	if (marb.global_position.y < 1.809):
		return true
	else:
		return false
