extends Node2D



func _on_dialoguebox_tree_exited():
	Transition.change_scene("res://act3/scene2/hallway.tscn")
