extends Node2D

@onready var success = $Success
@onready var failure = $Failure

func end_game_music():
	if PlayerVariables.game_end_text == "Player Wins!":
		success.play()
	else:
		failure.play()

func _ready():
	end_game_music()

func reset():
	PlayerVariables.player_win = 0
	PlayerVariables.player_lose = 0
	PlayerVariables.player_tie = 0
	PlayerVariables.game_end_text = ""


func _on_play_again_pressed():
	reset()
	get_tree().change_scene_to_file("res://gameWorld.tscn")


func _on_exit_main_menu_pressed():
	reset()
	get_tree().change_scene_to_file("res://Main.tscn")
