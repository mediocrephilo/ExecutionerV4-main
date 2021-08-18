extends Area2D

var canInteract = false
func _ready():
	$Label.hide()

func _input(event):
	if Input.is_action_just_pressed("ui_interact") and canInteract == true:
		print('waesgd')
		
func _on_tv_body_entered(body):
	if body.name == "player":
		$Label.show()
		canInteract = true
		$AnimatedSprite.play("static")

func _on_tv_body_exited(body):
	if body.name == "player":
		$Label.hide()
		$AnimatedSprite.play("default")
		canInteract = false
