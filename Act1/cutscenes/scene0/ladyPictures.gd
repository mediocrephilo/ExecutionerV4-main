extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_node("VideoPlayer"), "finished")
	#get_tree().change_scene("res://Act1/cutscenes/scene0/ladyPictures2.tscn")
	get_tree().change_scene("res://Act1/cutscenes/scene1/ACT1.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
