extends Control


var interact = false

func _on_chair_body_entered(body):
	if body.name == "player":
		interact == true
	if Input.is_action_just_pressed("ui_accept") and interact == true:
		Transition.change_scene("res://Act1/playerscenes/scene8/letter.tscn")

func _on_chair_body_exited(body):
	if body.name == "player":
		interact == false
