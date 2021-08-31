extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(0.5), "timeout")
	$VideoPlayer.play()
	yield(get_tree().create_timer(0.5), "timeout")
	yield(get_tree().create_timer(62), "timeout")
	Transition.change_scene("res://act2/scene5/scene5.tscn")
