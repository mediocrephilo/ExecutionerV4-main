extends Area2D

var canInteract = false

func _ready():
	$Label.hide()

func _on_ladder_body_entered(body):
	if body.name == "player":
		$Label.show()
		canInteract = true
		$AnimatedSprite.play("default")

func _on_ladder_body_exited(body):
	if body.name == "player":
		$Label.hide()
		canInteract = false
		$AnimatedSprite.stop()
		
