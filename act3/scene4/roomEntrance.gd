extends Node2D


func _on_Area2D_body_entered(body):
	if body.name == "player" and Input.is_action_just_pressed("ui_interact"):
		Transition.change_scene("res://drawncutscenes/meetingcutscene.tscn")
