extends Area2D


var canInteract = false
onready var pick = get_parent().get_node("pick")

func _ready():
	$Label.hide()

func _input(event):
	if Input.is_action_just_pressed("ui_interact") and canInteract == true:
			Transition.change_scene("res://drawncutscenes/garden3.tscn")


func _on_portal_body_entered(body):
	if body.name == "player" and pick.pick == true:
		$Label.show()
		canInteract = true


func _on_portal_body_exited(body):
	if body.name == "player":
		$Label.hide()
		canInteract = false
