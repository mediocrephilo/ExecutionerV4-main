extends Node2D

var yay = false
func _ready():
	$Label2.hide()
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and yay == true:
		Transition.change_scene("res://act3/scene2/hallway.tscn")
func _on_dialoguebox_tree_exited():
	$paris/Label.hide()
	$Label2.show()
	yay = true
