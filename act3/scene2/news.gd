extends Node2D


func _input(event):
	if Input.is_action_just_pressed("escape"):
		Transition.change_scene("act3/scene2/livingroom.tscn")
