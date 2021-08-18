extends Area2D

func _ready():
	$AnimatedSprite.play("default")


func _on_skull1_body_entered(body):
	if body.name == "player":
		print("hjahd")
