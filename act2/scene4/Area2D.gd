extends Area2D

func _ready():
	$AnimatedSprite.play("default")


func _on_Area2D_body_entered(body):
	if body.name == "player":
		print("hjahd")
