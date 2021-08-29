extends Area2D


func _on_ghost_body_entered(body):
	if body.name == "player":
		Transition.change_scene("res://Act3/scene4/SewerLeft1.tscn")
		

