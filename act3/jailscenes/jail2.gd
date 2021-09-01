extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var yay = false
func _ready():
	$dialoguebox/continuesprite.hide()
	$Label.hide()
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and yay == true:
		Transition.change_scene("res://act3/scene3/garden.tscn")
func _on_dialoguebox_tree_exited():
	$paris/Label.hide()
	$Label.show()
	yay = true

#func _on_dialoguebox_tree_exited():
	#Transition.change_scene("res://act3/scene2/hallway.tscn")

