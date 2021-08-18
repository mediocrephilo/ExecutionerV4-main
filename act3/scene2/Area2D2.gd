extends Area2D

var canInteract = false
func _ready():
	$Label2.hide()

func _input(event):
	if Input.is_action_just_pressed("ui_interact") and canInteract == true:
		print("gfa")
		
func _on_Area2D2_body_entered(body):
	if body.name == "player":
		$Label2.show()
		canInteract = true
		$AnimatedSprite.play("default")

func _on_Area2D2_body_exited(body):
	if body.name == "player":
		$Label2.hide()
		$AnimatedSprite.stop()
		canInteract = false
