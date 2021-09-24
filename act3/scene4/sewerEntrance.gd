extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	gameSaver.save_game("res://Act3/scene4/sewerEntrance.tscn")
	$player.set_process_input(false)
	SewerSound.playsound()
	
	
func _on_ladder_body_entered(body):
	if body.name == "player" and Input.is_action_just_pressed("ui_accept"):
		Transition.change_scene("res://Act3/scene4/Scene4Surface.tscn")


func _on_leftExit_body_entered(body):
	if body.name == "player":
		Transition.change_scene("res://Act3/scene4/maze1.tscn")


func _on_rightExit_body_entered(body):
	if body.name == "player":
		Transition.change_scene("res://Act3/scene4/SewerEntrance2.tscn")


func _on_dialoguebox_tree_exited():
	$player.set_process_input(true)
