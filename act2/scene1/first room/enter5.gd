extends Area2D

var canInteract = false
func _ready():
	$Label.hide()


func _on_enter5_body_entered(body):
	if body.name == "player":
		$Label.show()
		canInteract = true
		$AudioStreamPlayer.play()
		


func _on_enter5_body_exited(body):
	if body.name == "player":
		$Label.hide()
		canInteract = false
		$AudioStreamPlayer.stop()

func _input(event):
	if Input.is_action_just_pressed("ui_interact") and canInteract == true:
		Transition.change_scene("res://act2/scene1/second room/scene1.2.tscn")
