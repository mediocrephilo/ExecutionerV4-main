extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _on_exitscene6_body_entered(body):
	if body.name == "player":
		Transition.change_scene("res://Act1/playerscenes/scene6/scenesix.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
