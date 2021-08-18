extends Area2D

var canInteract = false
func _ready():
	$Label.hide()



func _on_enter2_body_entered(body):
	if body.name == "player":
		$Label.show()
		canInteract = true


func _on_enter2_body_exited(body):
	if body.name == "player":
		$Label.hide()
		canInteract = false
		

func _input(event):
	if Input.is_action_just_pressed("ui_interact") and canInteract == true:
		Transition.change_scene("res://act2/scene1/limbo area/scene1.8348379348.tscn")
