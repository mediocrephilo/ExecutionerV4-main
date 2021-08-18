extends Area2D


func _on_Area2D_body_entered(body):
	if body.name == "player":
		#print("asadfs")
		Transition.change_scene("res://act2/scene3/scene2.3.tscn")
