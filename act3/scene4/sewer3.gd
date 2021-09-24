extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	SewerSound.playsound()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_leftExit_body_entered(body):
	if body.name == "player":
		Transition.change_scene("res://Act3/scene4/sewerEntrance2.tscn")


func _on_rightExit_body_entered(body):
	if body.name == "player":
		Transition.change_scene("res://Act3/scene4/maze4.tscn")
