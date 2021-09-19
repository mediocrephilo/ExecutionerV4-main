extends Area2D


func _on_Area2D3_body_entered(body):
	if body.name == "player2":
		GameOver.transition("res://act3/scene5/obstaclecouse.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")
