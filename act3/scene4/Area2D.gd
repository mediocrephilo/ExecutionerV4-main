extends Area2D


var canInteract = false

func _ready():
	gameSaver.save_game("res://Act3/scene4/roomEntrance.tscn")
	SewerSound.playsound()
	
func _input(event):
	if Input.is_action_just_pressed("ui_interact") and canInteract == true:
		Transition.change_scene("res://drawncutscenes/meetingcutscene.tscn")
		
func _on_Area2D_body_entered(body):
	if body.name == "player":
		canInteract = true

func _on_Area2D_body_exited(body):
	if body.name == "player":
		canInteract = false
