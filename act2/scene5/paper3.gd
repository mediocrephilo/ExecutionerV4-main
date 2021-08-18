extends Area2D
var canInteract = false

func _ready():
	$Label.hide()
	$AnimatedSprite.stop()
func _on_paper3_body_entered(body):
	if body.name == "player":
		$Label.show()
		canInteract = true
		$AnimatedSprite.play("default")
		
func _on_paper3_body_exited(body):
	if body.name == "player":
		$Label.hide()
		canInteract = false
		$AnimatedSprite.stop()
		
func _input(event):
	if Input.is_action_just_pressed("ui_interact") and canInteract == true:
		print("dfsg")
