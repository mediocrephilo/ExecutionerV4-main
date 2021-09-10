extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(1), "timeout")
	$AnimationPlayer.play("fade")
	yield(get_tree().create_timer(4), "timeout")
	$AnimationPlayer.play_backwards("fade")
	yield(get_tree().create_timer(3), "timeout")
	get_tree().change_scene("res://Act1/cutscenes/scene1/ACT1.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
