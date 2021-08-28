extends Area2D

var canInteract = false

func _ready():
	$Label.hide()


func _input(event):
	if Input.is_action_just_pressed("ui_interact") and canInteract == true:
		print("sasdjfh")

func _on_end_body_entered(body):
	if body.name == "player2":
		$Label.show()
		$AnimatedSprite.play("default")
		canInteract = true



func _on_end_body_exited(body):
		if body.name == "player2":
			$Label.hide()
			canInteract = false
			$AnimatedSprite.stop()
