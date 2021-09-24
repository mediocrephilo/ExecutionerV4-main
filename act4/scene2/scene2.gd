extends Node2D

#const BALL = preload("res://act4/scene2/ball.tscn")
#onst BALL2 = preload("res://act4/scene2/ball2.tscn")

#func _on_Timer_timeout():
#	var ball = BALL.instance()
#	add_child(ball)
func _ready():
	gameSaver.save_game("res://Act4/scene2/scene2.tscn")
#func _on_Timer2_timeout():
#	var ball2 = BALL2.instance()
#	add_child(ball2)
	
func _process(delta):
	$front/frontmount.position.x -= 200 * delta
	$front/frontmount2.position.x -= 200 * delta
	$front/frontmount3.position.x -= 200 * delta
	$back.position.x -= 200 * delta
	$fence.position.x -= 200 * delta
	$sky.position.x -= 200 * delta
	$road.position.x -=200 * delta
	$Area2D.position.x -= 400*delta
	$ball.position.x -= 1500*delta
	$ball2.position.x -= 1500*delta
	$ball3.position.x -= 1500*delta
	$ball4.position.x -= 1500*delta
	$ball5.position.x -= 1500*delta
	$ball6.position.x -= 1500*delta
	$ball7.position.x -= 1500*delta
	$ball8.position.x -= 1500*delta
	$ball9.position.x -= 1500*delta
	$ball10.position.x -=1500*delta
	$ball11.position.x -= 1500*delta
	$ball12.position.x -= 1500*delta
	$ball13.position.x -= 1500*delta
	$ball14.position.x -= 1500*delta
	$ball15.position.x -= 1500*delta
	$ball16.position.x -= 1500*delta
	$ball17.position.x -= 1500*delta
	$ball18.position.x -= 1500*delta
	$ball19.position.x -= 1500*delta
	$ball20.position.x -= 1500*delta
	$ball21.position.x -= 1500*delta
	$ball22.position.x -= 1500*delta
	$ball23.position.x -= 1500*delta
	$ball24.position.x -= 1500*delta
	$ball25.position.x -= 1500*delta
	$ball26.position.x -= 1500*delta
	$ball27.position.x -= 1500*delta
	$ball28.position.x -= 1500*delta
	$ball29.position.x -= 1500*delta
	$ball30.position.x -= 1500*delta
	$ball31.position.x -= 1500*delta
	$ball32.position.x -= 1500*delta
	$ball33.position.x -= 1500*delta
	$ball34.position.x -= 1500*delta
	$ball35.position.x -= 1500*delta
	$ball36.position.x -= 1500*delta
	$ball37.position.x -= 1500*delta
	$ball38.position.x -= 1500*delta
	$ball39.position.x -= 1500*delta
	$ball40.position.x -= 1500*delta
	$ball41.position.x -= 1500*delta
	$ball42.position.x -= 1500*delta
	$ball43.position.x -= 1500*delta
	$ball44.position.x -= 1500*delta
	$ball45.position.x -= 1500*delta
	$ball46.position.x -= 1500*delta
	$ball47.position.x -= 1500*delta
	$ball48.position.x -= 1500*delta
	
	

func _on_Area2D_body_entered(body):
	if body.name == "player":
		$front/frontmount.position.x -= 0
		$front/frontmount2.position.x -= 0
		$front/frontmount3.position.x -= 0
		$back.position.x -= 0
		$fence.position.x -= 0
		$sky.position.x -= 0
		$road.position.x -= 0
		$Area2D.position.x -= 0
		#get_tree().paused =true
		$player/AnimatedSprite.play("idle")


func _on_ball_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball2_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball3_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball4_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball5_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball6_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball7_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball8_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball9_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball10_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball11_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball12_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball13_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball14_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball15_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball16_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball17_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball18_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball19_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball20_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball21_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball22_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball23_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball24_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")

func _on_ball25_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball26_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball27_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball28_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball29_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball30_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball31_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball32_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball33_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball34_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball35_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball36_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball37_body_entered(body):if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")

func _on_ball38_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")


func _on_ball39_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")

func _on_ball40_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")

func _on_ball41_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")

func _on_ball42_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")

func _on_ball43_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")

func _on_ball44_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")

func _on_ball45_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")

func _on_ball46_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")

func _on_ball47_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")

func _on_ball48_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene2/scene2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")
