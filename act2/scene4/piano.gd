extends Area2D

var canInteract = false

func _ready():
	$Label.hide()
	
func _input(event):
	if Input.is_action_just_pressed("ui_interact") and canInteract == true:
		Transition.change_scene("res://act2/scene4/piano.tscn")



func _on_piano_body_entered(body):
	if body.name == "player":
		$AnimatedSprite.play("default")
		$Label.show()
		canInteract = true


func _on_piano_body_exited(body):
	if body.name == "player":
		$AnimatedSprite.stop()
		$Label.hide()
		canInteract = false
