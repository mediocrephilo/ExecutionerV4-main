extends Node2D


var yay = false
func _ready():
	gameSaver.save_game("res://Act3/jailscenes/jail5.tscn")
	$dialoguebox2/continuesprite.hide()
#func _process(delta):
	#if Input.is_action_just_pressed("ui_accept") and yay == true:
func _on_dialoguebox_tree_exited():
	$paris/Label.hide()
	yay = true
