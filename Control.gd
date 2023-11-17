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

func playerWin():
	if player == 1 and computer == 3:
		print("Win with Rock")
		
		await get_node(computer_animation).animation_finished
		node_animation("playerWin/AnimationPlayer")
	elif player == 2 and computer == 1:
		print("Win with Paper")
		
		await get_node(computer_animation).animation_finished
		node_animation("playerWin/AnimationPlayer")
	elif player == 3 and computer == 2:
		print("Win with Scissors")
		
		await get_node(computer_animation).animation_finished
		node_animation("playerWin/AnimationPlayer")
	
func playerLose():
	if player == 1 and computer == 2:
		print("Lose")
		await get_node(computer_animation).animation_finished
		node_animation("playerLose/AnimationPlayer")
	elif player == 2 and computer == 3:
		print("Lose")
		await get_node(computer_animation).animation_finished
		node_animation("playerLose/AnimationPlayer")
	elif player == 3 and computer == 1:
		print("Lose")
		await get_node(computer_animation).animation_finished
		node_animation("playerLose/AnimationPlayer")
	
func tie():
	if player == computer:
		print("Tie")
		await get_node(computer_animation).animation_finished
		node_animation("playerTie/AnimationPlayer")
		
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

