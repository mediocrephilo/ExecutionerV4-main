extends Area2D



func _on_Area2D_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act3/scene2/hallway.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")
