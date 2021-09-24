extends Area2D

var canInteract = false
func _ready():
	gameSaver.save_game("res://Act3/scene2/hallway.tscn")
	$Label.hide()

func _input(event):
	if Input.is_action_just_pressed("ui_interact") and canInteract == true:
		Transition.change_scene("act3/scene2/bedroom1.tscn")
		
func _on_Area2D_body_entered(body):
	if body.name == "player":
		$Label.show()
		canInteract = true
		$AnimatedSprite.play("default")

func _on_Area2D_body_exited(body):
	if body.name == "player":
		$Label.hide()
		$AnimatedSprite.stop()
		canInteract = false
