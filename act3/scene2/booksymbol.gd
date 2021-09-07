extends Area2D

var canInteract = false
func _ready():
	$Label2.hide()
func _on_Area2D_body_entered(body):
	if body.name == "player":
		$Label2.show()
		$AnimatedSprite.play("default")
		canInteract = true
func _on_Area2D_body_exited(body):
	if body.name == "player":
		$AnimatedSprite.stop()
		$Label2.hide()
		canInteract = false

func _input(event):
	if Input.is_action_just_pressed("ui_accept") and canInteract == true:
		Transition.change_scene("res://act3/scene2/light.tscn")

