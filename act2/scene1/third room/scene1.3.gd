extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	gameSaver.save_game("res://act2/scene1/third room/scene1.3.tscn")
	$AudioStreamPlayer.play()
	$AudioStreamPlayer2.play()
