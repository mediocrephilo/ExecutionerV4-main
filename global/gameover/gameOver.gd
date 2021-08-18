extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func transition(path):
	$ColorRect/AnimationPlayer.play("fade")
	$AudioStreamPlayer.play()
	if Input.is_action_just_pressed("ui_accept"):
		Transition.change_scene(path)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
