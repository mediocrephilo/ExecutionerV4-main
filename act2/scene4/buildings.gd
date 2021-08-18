extends Area2D

var canInteract = false

func _ready():
	$Label.hide()


func _input(event):
	if Input.is_action_just_pressed("ui_interact") and canInteract == true:
		Transition.change_scene("act2/scene4/bake.tscn")

func _on_buildings_body_entered(body):
	if body.name == "player":
		$Label.show()
		$AnimatedSprite.play("default")
		canInteract = true


func _on_buildings_body_exited(body):
	if body.name == "player":
		$Label.hide()
		canInteract = false
		$AnimatedSprite.stop()
