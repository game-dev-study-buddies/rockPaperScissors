extends Control


var player
var computer
var computer_animation


func node_animation(node):
	get_node(node).play('Show')
	await get_node(node).animation_finished
	get_node(node).stop()

func computerChoice():
	computer = randi_range(1, 3)
	if computer == 1:
		computer_animation = "opponentRock/AnimationPlayer"
		node_animation(computer_animation)
	elif computer == 2:
		computer_animation = "opponentPaper/AnimationPlayer"
		node_animation(computer_animation)
	elif computer == 3:
		computer_animation = "opponentScissors/AnimationPlayer"
		node_animation(computer_animation)

func roundResult():
#	Check if Player wins this round
	if player == 1 and computer == 3:
		PlayerVariables.player_win += 1
		
		await get_node(computer_animation).animation_finished
		node_animation("playerWin/AnimationPlayer")
	elif player == 2 and computer == 1:
		PlayerVariables.player_win += 1
		
		await get_node(computer_animation).animation_finished
		node_animation("playerWin/AnimationPlayer")
	elif player == 3 and computer == 2:
		PlayerVariables.player_win += 1
		
		await get_node(computer_animation).animation_finished
		node_animation("playerWin/AnimationPlayer")
	
#	Check if Player woses this round
	if player == 1 and computer == 2:
		PlayerVariables.player_lose += 1
		
		await get_node(computer_animation).animation_finished
		node_animation("playerLose/AnimationPlayer")
	elif player == 2 and computer == 3:
		PlayerVariables.player_lose += 1
		
		await get_node(computer_animation).animation_finished
		node_animation("playerLose/AnimationPlayer")
	elif player == 3 and computer == 1:
		PlayerVariables.player_lose += 1
		
		await get_node(computer_animation).animation_finished
		node_animation("playerLose/AnimationPlayer")
	
#	Check if Player ties
	if player == computer:
		
		PlayerVariables.player_tie += 1
		
		await get_node(computer_animation).animation_finished
		node_animation("playerTie/AnimationPlayer")

#func reset():
#	PlayerVariables.player_win = 0
#	PlayerVariables.player_lose = 0
#	PlayerVariables.player_tie = 0

func gameResult ():
	if PlayerVariables.player_win == 2:
		PlayerVariables.game_end_text = "Player Wins!" 
		get_tree().change_scene_to_file("res://EndGame.tscn")
	
	if PlayerVariables.player_lose == 2:
		PlayerVariables.game_end_text = "Player Loses!"
		get_tree().change_scene_to_file("res://EndGame.tscn")

func checkResult():
	roundResult()
	gameResult()

func _on_rock_pressed():
	player = 1
	computerChoice()
	checkResult()

func _on_paper_pressed():
	player = 2
	computerChoice()
	checkResult()

func _on_scissors_pressed():
	player = 3
	computerChoice()
	checkResult()



