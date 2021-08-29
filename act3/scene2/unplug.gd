extends Node2D

var one = false
var two = false
var three = false
var four = false
var five = false

func _on_Area2D_body_entered(body):
	if body.name == "redbox":
		one = true
		checkpassed()
	if body.name == "redbox2":
		two = true
		checkpassed()
	if body.name == "redbox3":
		three = true
		checkpassed()
	if body.name == "redbox4":
		four = true
		checkpassed()
	if body.name == "redbox5":
		five = true
		checkpassed()
		
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Transition.change_scene("res://act3/scene2/unplug.tscn")
		
func checkpassed():
	if one == true and two == true and three == true and four == true and five == true:
		Transition.change_scene("act3/scene2/bathroom3.tscn")
