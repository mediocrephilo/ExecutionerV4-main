extends Node2D

func _ready():

	yield(get_tree().create_timer(0.5), "timeout")
	$VideoPlayer.play()
	yield(get_tree().create_timer(0.5), "timeout")
	yield(get_tree().create_timer(7), "timeout")
	Transition.change_scene("res://act3/scene2/livingroom.tscn")
