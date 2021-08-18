extends Area2D

func _on_Area2D3_body_entered(body):
	if body.name == "player":
		#print("asadfs")
		Transition.change_scene("res://act3/scene2/downstairs.tscn")
