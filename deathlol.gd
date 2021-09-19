extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():

	yield(get_tree().create_timer(0.5), "timeout")
	$VideoPlayer.play()
	yield(get_tree().create_timer(0.5), "timeout")
	yield(get_tree().create_timer(2), "timeout")
	GameOver.transition("res://act4/scene5.tscn")
	GameOver.change(true)
	Transition.change_scene("res://global/gameover/gameOver.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
