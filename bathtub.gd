extends Node2D


func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Transition.change_scene("res://act3/scene2/bathroom4.tscn")
