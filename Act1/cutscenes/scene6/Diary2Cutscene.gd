extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var canInteract = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect.hide()
	$Sprite.hide()
	yield(get_tree().create_timer(1), "timeout")
	$AudioStreamPlayer.play()
	$AnimatedSprite.play("default")
	yield(get_tree().create_timer(2), "timeout")
	canInteract = true
	$ColorRect.show()
	$Sprite.show()
	$ColorRect/AnimationPlayer.play("fade")

func _input(event):
	if Input.is_action_just_pressed("ui_accept") and canInteract == true:
		Transition.change_scene("res://Act1/playerscenes/scene6/scenesixone.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
