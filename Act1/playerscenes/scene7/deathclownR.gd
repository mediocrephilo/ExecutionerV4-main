extends Area2D

func _ready():
	$AnimatedSprite.hide()
func _on_deathclownR_body_entered(body):
	if body.name == "player":
		$AnimatedSprite.show()
		$Sprite.hide()
		$AnimatedSprite.play("nom")	
		yield(get_tree().create_timer(0.75), "timeout")
		GameOver.transition("res://Act1/playerscenes/scene6/scenesixone.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")
