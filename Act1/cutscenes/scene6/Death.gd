extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Input.is_action_just_pressed("ui_accept"):
		Transition.change_scene("res://Act1/cutscenes/scene6/SceneSixCutscene1.tscn")
