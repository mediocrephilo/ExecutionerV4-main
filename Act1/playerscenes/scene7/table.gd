extends Area2D



func _on_table_body_entered(body):
	if body.name == "player":
		Transition.change_scene("res://Act1/playerscenes/scene8/sceneEight.tscn")
