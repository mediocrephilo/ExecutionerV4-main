extends Area2D

func _ready():
	$AnimatedSprite.play("default")


func _on_skull1_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act3/scene3/puzzle4.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")
