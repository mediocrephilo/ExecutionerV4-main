extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var canInteract = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.hide()
	yield(get_tree().create_timer(5), "timeout")
	canInteract = true
	$Label.show()
	
func _input(event):
	if Input.is_action_just_pressed("ui_cancel") and canInteract == true:
		Transition.change_scene("res://Act1/playerscenes/scenez11/SceneEleven.tscn")
	if Input.is_action_just_pressed("repent") and canInteract == true:
		Transition.change_scene("res://drawncutscenes/act1girl.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
