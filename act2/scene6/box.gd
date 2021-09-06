extends Area2D

var canInteract = false
var cantalk = false

func _ready():
	$Label.hide()
	$beep/AnimatedSprite.hide()
func _on_box_body_entered(body):
	if body.name == "player":
		$Label.show()
		canInteract = true
		$AnimatedSprite.play("default")
		
func _on_box_body_exited(body):
	if body.name == "player":
		$Label.hide()
		canInteract = false
		$AnimatedSprite.stop()
		
func _input(event):
	if Input.is_action_just_pressed("ui_accept") and canInteract == true:
		$beep/AnimatedSprite.show()
		$beep/AnimatedSprite.play("appear")
	if Input.is_action_just_pressed("ui_accept") and cantalk == true:
		Transition.change_scene("res://drawncutscenes/act2boi.tscn")
		
func _on_AnimatedSprite_animation_finished():
	$beep/AnimatedSprite.play("vibing")
	$Label.text = "Talk"
	cantalk = true
	
