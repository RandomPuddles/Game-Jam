extends TextureButton

var scene: PackedScene = preload("res://Scenes/tutorial.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pressed() -> void:
	# bring up page with instructions
	# and maybe story (ALL AT ONCE)
	# like old game manual
	get_tree().change_scene_to_packed(scene)
	pass
