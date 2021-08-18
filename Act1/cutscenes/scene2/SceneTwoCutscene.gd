extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var canInteract = false

# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(1), "timeout")
	$AudioStreamPlayer.play()
	$AnimatedSprite.play("default")
	canInteract = true

func _input(event):
	if Input.is_action_just_pressed("ui_cancel") and canInteract == true:
		Transition.change_scene("res://Act1/playerscenes/scene3/SceneThree.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
