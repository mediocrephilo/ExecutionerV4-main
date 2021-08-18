extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _on_scene10exit_body_entered(body):
	if body.name == "player":
		Transition.change_scene("res://Act1/playerscenes/scene9/SceneNine1.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
