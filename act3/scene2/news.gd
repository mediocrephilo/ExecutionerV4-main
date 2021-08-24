extends Node2D


func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		Transition.change_scene("act3/scene2/livingroom.tscn")
