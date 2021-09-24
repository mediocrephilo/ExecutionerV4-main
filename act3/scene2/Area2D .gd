extends Area2D
var canInteract = false
func _ready():
	gameSaver.save_game("res://Act3/scene2/downstairs.tscn")
	$Label.hide()
func _on_Area2D_body_entered(body):
	if body.name == "player":
		$Label.show()
		$AnimatedSprite.play("default")
		canInteract = true
func _on_Area2D_body_exited(body):
	if body.name == "player":
		$AnimatedSprite.stop()
		$Label.hide()
		canInteract = false

func _input(event):
	if Input.is_action_just_pressed("ui_interact") and canInteract == true:
		Transition.change_scene("act3/scene2/bathroom.tscn")
