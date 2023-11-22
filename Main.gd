extends Node2D


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed():
	get_tree().change_scene_to_file("res://gameWorld.tscn")


func _on_button_2_pressed():
	get_tree().quit()
