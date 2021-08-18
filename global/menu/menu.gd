extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(2), "timeout")
	$AudioStreamPlayer.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		Transition.change_scene("res://Act1/cutscenes/scene0/InitialCutscene.tscn")
		print("ajndk")
