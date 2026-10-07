extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var music_loop = preload("res://Assets/Am I in Space or WHAT.wav")
	var audio_player = AudioStreamPlayer.new()
	audio_player.stream = music_loop
	add_child(audio_player)
	audio_player.finished.connect(func(): audio_player.queue_free())
	audio_player.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
