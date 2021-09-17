extends Node2D

func _ready():
	$Label.hide()
	yield(get_tree().create_timer(5), "timeout")
	$Label.show()
	$Label/AnimationPlayer.play("New Anim")



func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Transition.change_scene("res://drawncutscenes/smolparis.tscn")
