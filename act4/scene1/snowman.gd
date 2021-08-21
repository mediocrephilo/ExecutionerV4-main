extends Area2D

var canInteract = false

func _ready():
	$Label.hide()

func _on_snowman_body_entered(body):
	if body.name == "player":
		$Label.show()
		canInteract = true
		$AnimatedSprite.play("default")


func _on_snowman_body_exited(body):
	if body.name == "player":
		$Label.hide()
		canInteract = false
		$AnimatedSprite.stop()

func _input(event):
	if Input.is_action_just_pressed("ui_interact") and canInteract == true:
		Transition.change_scene("res://act4/cutscene/baby/Node2D.tscn")
