extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(_delta):
	yield(get_tree().create_timer(0.5), "timeout")
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://act2/scene5/scene52.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
