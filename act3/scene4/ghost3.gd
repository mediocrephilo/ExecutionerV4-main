extends Area2D

var canInteract = false
func _ready():
	$Label.hide()

func _input(event):
	if Input.is_action_just_pressed("ui_interact") and canInteract == true:
		print("westryg")
		
func _on_ghost_body_entered(body):
	if body.name == "player":
		$Label.show()
		canInteract = true

func _on_ghost_body_exited(body):
	if body.name == "player":
		$Label.hide()
		canInteract = false
