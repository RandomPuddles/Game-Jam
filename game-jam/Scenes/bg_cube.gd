extends Node2D

@export var ralsei: Sprite2D
var ralseiBottom: float
@export var bg: Sprite2D
@export var scene3D: Node3D
var cam3D: Camera3D
var marb: Node3D
var marbCoord: Vector2
var marb3DYLevel: float
var marbHeight: float
var marbCoordBtoom: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#cam3D = get_tree().get_first_node_in_group("view").get_child(0).get_tree().get_first_node_in_group("the3DCamera")
	#marb = get_tree().get_first_node_in_group("view").get_child(0).get_tree().get_first_node_in_group("Player")
	#cam3D = marb.camera_3d
	#cam3D = get_tree().current_scene.get_node("Camera3D")
	cam3D = scene3D.get_child(0)
	marb = scene3D.get_child(1).get_child(0)
	marbCoord = cam3D.unproject_position(marb.position)
	marbHeight = 25
	marbCoordBtoom = marbCoord.y + marbHeight
	marb3DYLevel = marb.global_position.y
	
	print(marbCoord)
	#ralseiSprite = get_node("ralsei")
	#bgsprite = get_node("bgDoodle")
	
	ralsei = get_node("CanvasGroupSprites/ralsei")
	ralseiBottom = ralsei.position.y + (ralsei.texture.get_height() / 2)
	bg = get_node("CanvasGroupSprites/theBackground")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#marblePos = 0
	#cam3D = get_tree().get_first_node_in_group("view").get_child(0).get_tree().get_first_node_in_group("the3DCamera")
	#marb = get_tree().get_first_node_in_group("view").get_child(0).get_tree().get_first_node_in_group("Player")
	#cam3D = scene3D.get_child(0)
	#marb = scene3D.get_child(1).get_child(0)
	marbCoord = cam3D.unproject_position(marb.position)
	marbCoordBtoom = marbCoord.y + marbHeight
	#print(marbCoord)
	marb3DYLevel = marb.global_position.y
	print(marb3DYLevel)
	
	if marbCoordBtoom < ralseiBottom:
		ralsei.z_index = 2
	else:
		ralsei.z_index = 0
	pass
	
	if marb3DYLevel < 0:
		bg.z_index = 2
	else:
		bg.z_index = 0
	pass

func check_ball_position():
	# if sprite's y position is lower than
	#if ralseiii.global_position.y > marblePos.y
	
	pass
