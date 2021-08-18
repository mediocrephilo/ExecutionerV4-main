extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.hide()

func _on_Area2D2_body_entered(body):
	if body.name == "player2":
		$Sprite.show()
func _on_Area2D2_body_exited(body):
	if body.name == "player2":
		$Sprite.hide()
