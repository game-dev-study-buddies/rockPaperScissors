extends Node2D


func _on_play_again_pressed():
	get_tree().change_scene_to_file("res://gameWorld.tscn")


func _on_exit_main_menu_pressed():
	get_tree().change_scene_to_file("res://Main.tscn")
