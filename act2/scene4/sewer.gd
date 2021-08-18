extends Area2D

var canInteract = false

func _ready():
	$sewerLabel.hide()


func _input(event):
	if Input.is_action_just_pressed("ui_interact") and canInteract == true:
			Transition.change_scene("res://act2/scene5/fallAnimation.tscn")



func _on_sewer_body_entered(body):
	if body.name == "player":
		$sewerLabel.show()
		$AnimatedSprite.play("default")
		canInteract = true


func _on_sewer_body_exited(body):
	if body.name == "player":
		$sewerLabel.hide()
		canInteract = false
		$AnimatedSprite.stop()
