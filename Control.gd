extends Control


var player
var computer


func node_animation(node):
	get_node(node).play('Show')
	await get_node(node).animation_finished
	get_node(node).stop()

func computerChoice():
	computer = randi_range(1, 3)
	if computer == 1:
		node_animation("opponentRock/AnimationPlayer")
	elif computer == 2:
		node_animation("opponentPaper/AnimationPlayer")		
	elif computer == 3:
		node_animation("opponentScissors/AnimationPlayer")

func playerWin():
	if player == 1 and computer == 3:
		print("You Win!")
	elif player == 2 and computer == 1:
		print("You Win!")
	elif player == 3 and computer == 2:
		print("You Win!")
	
func playerLose():
	if player == 1 and computer == 2:
		node_animation("computerWin/AnimationPlayer")
	elif player == 2 and computer == 3:
		node_animation("computerWin/AnimationPlayer")
	elif player == 3 and computer == 1:
		node_animation("computerWin/AnimationPlayer")
	
	
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

