extends Area2D

var canInteract = false
func _ready():
	$Label.hide()
func _on_desk_body_entered(body):
	if body.name == "player":
		$Label.show()
		$AnimatedSprite.play("default")
		canInteract = true
func _on_desk_body_exited(body):
	if body.name == "player":
		$AnimatedSprite.stop()
		$Label.hide()
		canInteract = false

func _input(event):
	if Input.is_action_just_pressed("ui_interact") and canInteract == true:
		print("wgfhhwerq")
