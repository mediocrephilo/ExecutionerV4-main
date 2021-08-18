extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	SewerSound.playsound()
	$AudioStreamPlayer2.play()
	yield(get_tree().create_timer(0.5), "timeout")
	$VideoPlayer.play()
	yield(get_tree().create_timer(0.5), "timeout")
	$AudioStreamPlayer2.stop()
	$AudioStreamPlayer.play()
	yield(get_tree().create_timer(0.2), "timeout")
	Transition.change_scene("res://act2/maze/maze.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
