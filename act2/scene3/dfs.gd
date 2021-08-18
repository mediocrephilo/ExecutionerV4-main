extends Area2D



func _on_Area2D_body_shape_entered(body_id, body, body_shape, local_shape):
	if body.name == "player":
		Transition.change_scene("res://act2/scene4/bread.tscn")
