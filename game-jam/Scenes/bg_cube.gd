extends Node2D

@export var ralsei_ref: Node2D
@export var bg_ref: Node2D
var ralseiii: Node2D
var marblePos: float
var cam3D: Camera3D
var marb: Node3D
var marbCoord: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	cam3D = get_tree().get_first_node_in_group("view").get_child(0).get_tree().get_first_node_in_group("the3DCamera")
	marb = get_tree().get_first_node_in_group("view").get_child(0).get_tree().get_first_node_in_group("Player")
	#cam3D = marb.camera_3d
	#cam3D = get_tree().current_scene.get_node("Camera3D")
	marbCoord = cam3D.unproject_position(marb.position)
	
	print(marbCoord)
	#ralseiSprite = get_node("ralsei")
	#bgsprite = get_node("bgDoodle")
	
	ralseiii = get_node("CanvasGroupTop/ralsei")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#marblePos = 0
	marbCoord = cam3D.unproject_position(marb.position)
	print(marbCoord)
	pass

func check_ball_position():
	# if sprite's y position is lower than
	#if ralseiii.global_position.y > marblePos.y
	
	pass
