extends Area2D

func _ready():
	$AnimatedSprite.play("default")


func _on_skull6_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act3/scene3/puzzle2.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")
