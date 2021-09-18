extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("default")
	$AnimatedSprite2.play("default")
	$AnimatedSprite3.play("default")
	$AnimatedSprite4.play("default")

func _on_Area2D_body_entered(body):
	if body.name == "smolboi":
		GameOver.transition("res://act2/maze/maze.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")
