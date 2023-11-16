extends Control


var player
var computer


	
func computerChoice():
	computer = randi_range(1, 3)
	if computer == 1:
		get_node("opponentRock/AnimationPlayer").play('Show')
		await get_node("opponentRock/AnimationPlayer").animation_finished
		get_node("opponentRock/AnimationPlayer").queue_free()
	elif computer == 2:
		get_node("opponentPaper/AnimationPlayer").play('Show')
		await get_node("opponentPaper/AnimationPlayer").animation_finished
		get_node("opponentPaper/AnimationPlayer").queue_free()
	elif computer == 3:
		get_node("opponentScissors/AnimationPlayer").play('Show')
		await get_node("opponentScissors/AnimationPlayer").animation_finished
		get_node("opponentScissors/AnimationPlayer").queue_free()

func playerWin():
	if player == 1 and computer == 3:
		print("You Win!")
	elif player == 2 and computer == 1:
		print("You Win!")
	elif player == 3 and computer == 2:
		print("You Win!")
	
func playerLose():
	if player == 1 and computer == 2:
		print("You Lose!")
	elif player == 2 and computer == 3:
		print("You Lose!")
	elif player == 3 and computer == 1:
		print("You Lose!")
	
	
func tie():
	if player == computer:
		print("Tie")
		
func checkResult():
	playerWin()
	playerLose()
	tie()

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

