extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_exit_body_entered(body):
	if body.name == "player":
		Transition.change_scene("res://Act1/playerscenes/scenez11/SceneEleven.tscn")
		
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Transition.change_scene("res://Act1/playerscenes/scenez10/SceneTen.tscn")
