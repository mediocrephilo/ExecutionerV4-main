extends Area2D

var canInteract = false

func _ready():
	$Label.hide()
	ForestSound.playsound()
	gameSaver.save_game("res://Act1/playerscenes/scene1/SceneOne.tscn")
func _on_Area2D_body_entered(body):
	if body.name == "player":
		$Label.show()
		canInteract = true
func _on_Area2D_body_exited(body):
	if body.name == "player":
		$Label.hide()
		canInteract = false

func _input(event):
	if Input.is_action_just_pressed("ui_interact") and canInteract == true:
		$AudioStreamPlayer.play()
		Transition.change_scene("res://Act1/playerscenes/scene2/room.tscn")
		yield($AudioStreamPlayer, "finished")
		ForestSound.stopsound()
