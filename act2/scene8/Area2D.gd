extends Area2D


func _on_Area2D_body_entered(body):
	if body.name == "player":
		Transition.change_scene("res://act2/scene9/scene9.tscn")
