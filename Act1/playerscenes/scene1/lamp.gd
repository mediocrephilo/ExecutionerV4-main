extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite4.play("default")

func _on_lamp_body_entered(body):
	if body.name == "player":
		$AnimatedSprite4.play("off")
func _on_lamp_body_exited(body):
		$AnimatedSprite4.play("default")
