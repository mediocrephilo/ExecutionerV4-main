extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("default")


func _on_AnimatedSprite_animation_finished():
	Transition.change_scene("res://Act1/playerscenes/scene7/scene7.tscn")
