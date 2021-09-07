extends Area2D


var canInteract = false

func _ready():
	$Label.hide()
	$AnimatedSprite.play("default")
	$AnimatedSprite2.play("default")
func _on_Area2D_body_entered(body):
	if body.name == "player":
		$Label.show()
		canInteract = true
func _on_Area2D_body_exited(body):
	if body.name == "player":
		$Label.hide()
		canInteract = false

func _input(event):
	if Input.is_action_just_pressed("ui_accept") and canInteract == true:
		Transition.change_scene("res://drawncutscenes/corridorscene.tscn")
