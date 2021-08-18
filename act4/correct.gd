extends Area2D

var canInteract = false
func _ready():
	$Label.hide()

func _input(event):
	if Input.is_action_just_pressed("ui_interact") and canInteract == true:
		Transition.change_scene("res://act4/scene5room4.tscn")
		
func _on_door_body_entered(body):
	if body.name == "player":
		$Label.show()
		canInteract = true
		$AnimatedSprite.play("default")

func _on_door_body_exited(body):
	if body.name == "player":
		$Label.hide()
		canInteract = false
