extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$playerSprite.play("idle")


func _on_ohnocut_tree_exited():
	Transition.change_scene("res://act2/scene4/oshoot.tscn")
