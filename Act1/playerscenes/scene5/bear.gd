extends KinematicBody2D

func _ready():
	$AnimatedSprite.flip_h = true
	$AnimatedSprite.play("default")
	
