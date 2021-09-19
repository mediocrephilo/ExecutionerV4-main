extends Area2D

func _process(delta):
	position.y += 2000 * delta
	
func _on_Area2D_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act3/scene2/kitchen.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")
	

