extends Node2D

@onready var audio_player = $AudioStreamPlayer2D

func _ready():
	audio_player.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed():
	get_tree().change_scene_to_file("res://gameWorld.tscn")


func _on_exit_pressed():
	get_tree().quit()
