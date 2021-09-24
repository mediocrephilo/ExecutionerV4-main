extends Node2D


var yay = false
func _ready():
	gameSaver.save_game("res://Act3/jailscenes/jail4.tscn")
	$dialoguebox/continuesprite.hide()
	$Label.hide()
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and yay == true:
		Transition.change_scene("res://act3/scene5/obstaclecouse.tscn")
func _on_dialoguebox_tree_exited():
	$paris/Label.hide()
	$Label.show()
	yay = true
