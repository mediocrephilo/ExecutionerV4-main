extends Area2D




func _on_Area2D_body_entered(body):
	if body.name == "smolboi":
			Transition.change_scene("res://act2/cutscenes/boyend1.tscn")
