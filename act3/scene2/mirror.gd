extends Area2D

var canInteract = false

func _input(event):
	if Input.is_action_just_pressed("ui_interact") and canInteract == true:
		Transition.change_scene("act3/scene2/mirror.tscn")
		
func _on_mirror_body_entered(body):
	if body.name == "player":
		canInteract = true
		$AnimatedSprite.play("default")

func _on_mirror_body_exited(body):
	if body.name == "player":
		$AnimatedSprite.stop()
		canInteract = false
