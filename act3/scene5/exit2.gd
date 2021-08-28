extends Area2D

func _on_Area2D_body_entered(body):
	if body.name == "player2":
		Transition.change_scene("res://act3/scene5/obstaclecouse3.tscn")
