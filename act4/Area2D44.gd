extends Area2D



func _on_Area2D4_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene4.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")
