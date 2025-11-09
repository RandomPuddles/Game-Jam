extends Timer
@onready var time_left_label: Label = $"../TimeLeftLabel"
var level_time_limit: float = 10.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_timeout() -> void:
	level_time_limit -= 0.1
	time_left_label.text = "Time Left: %.1f" % level_time_limit
	if level_time_limit <= 0:
		level_time_limit = 0
		get_tree().quit()
