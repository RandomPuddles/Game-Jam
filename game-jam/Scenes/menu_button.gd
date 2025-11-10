extends Button

var return_menu: PackedScene = preload("res://Scenes/Main_Menu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_pressed() -> void:
	get_tree().change_scene_to_packed(return_menu)
