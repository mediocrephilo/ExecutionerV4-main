extends Node2D

var blue = false
var red = false
var green = false

func _on_blue_body_entered(body):
	if body is BluBox:
		blue = true
		CheckPassed()
func _on_blue_body_exited(body):
	if body is BluBox:
		blue = false
		CheckPassed()

func _on_red_body_entered(body):
	if body is ReBox:
		red = true
		CheckPassed()

func _on_red_body_exited(body):
	if body is ReBox:
		red = false
		CheckPassed()

func _on_green_body_entered(body):
	if body is GrenBox:
		green = true
		CheckPassed()
func _on_green_body_exited(body):
	if body is BluBox:
		green = false
		CheckPassed()
	
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		 Transition.change_scene("act4/scene3/scene3.tscn")
func CheckPassed():
	if green and red and blue:
		Transition.change_scene("act4/scene3/scene3.1.after.tscn")

