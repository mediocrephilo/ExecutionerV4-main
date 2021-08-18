extends Area2D

func _ready():
	$AnimatedSprite.hide()
func _on_deathclownR_body_entered(body):
	if body.name == "player":
		$AnimatedSprite.show()
		$Sprite.hide()
		$AnimatedSprite.play("nom")	
		yield(get_tree().create_timer(0.75), "timeout")
		get_tree().change_scene("res://Act1/cutscenes/scene7/ClownDeath.tscn")
