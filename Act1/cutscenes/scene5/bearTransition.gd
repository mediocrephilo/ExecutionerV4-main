extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$player/playerSprite.play("idle")

func _on_dialoguebox_tree_exited():
	$roar.play()
	$bear/AnimationPlayer.play("New Anim")
	yield($bear/AnimationPlayer, "animation_finished")
	Transition.change_scene("res://Act1/playerscenes/scene5/scene5.tscn")
