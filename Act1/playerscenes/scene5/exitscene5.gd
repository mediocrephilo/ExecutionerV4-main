extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



func _on_exitscene5_body_entered(body):
	if body.name == "player":
		Transition.change_scene("res://Act1/playerscenes/scene5/black.tscn")
