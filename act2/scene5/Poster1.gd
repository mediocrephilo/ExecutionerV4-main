extends Area2D


var canInteract = false

func _on_Poster1_body_entered(body):
	if body.name == "player":
		canInteract = true
		$AnimatedSprite.play("default")

func _on_Poster1_body_exited(body):
	if body.name == "player":
		canInteract = false
		$AnimatedSprite.stop()
		
func _input(event):
	if Input.is_action_just_pressed("ui_accept") and canInteract == true:
		get_tree().change_scene("res://act2/scene5/Poster1.tscn")
