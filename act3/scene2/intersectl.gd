extends Area2D
func _on_Area2D2_body_entered(body):
	if body.name == "player":
		#print("asadfs")
		Transition.change_scene("res://act3/scene2/kitchen.tscn")
