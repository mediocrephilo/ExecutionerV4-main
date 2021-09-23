extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _ready():
	JailSound.playsound()
	gameSaver.save_game("res://Act1/playerscenes/scenez11/SceneEleven.tscn")
# Called when the node enters the scene tree for the first time.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("one"):
		Transition.change_scene("res://Act1/playerscenes/scenez11/bed.tscn")
	if Input.is_action_just_pressed("two"):
		Transition.change_scene("res://Act1/playerscenes/scenez11/basket.tscn")
	if Input.is_action_just_pressed("three"):
		Transition.change_scene("res://Act1/playerscenes/scenez11/diary3.tscn")
