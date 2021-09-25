extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.hide()
	yield(get_tree().create_timer(5), "timeout")
	$Label.show()
	$Label/AnimationPlayer.play("New Anim")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Transition.change_scene("res://Act1/scene8/SceneEight3")
#	pass
