extends Area2D


# Declare member variables here. Examples:
# var a = 2
var canInteract = false
func _ready():
	$Label.hide()
func _on_Area2D3_body_entered(body):
	if body.name == "player2":
		$Label.show()
		canInteract = true
func _on_Area2D3_body_exited(body):
	if body.name == "player2":
		$Label.hide()
		canInteract = false

func _input(_event):
	if Input.is_action_just_pressed("ui_interact") and canInteract == true:
		$AudioStreamPlayer.play()
		Transition.change_scene("res://Act1/playerscenes/scene5/black.tscn")
		yield($AudioStreamPlayer, "finished")
		HorrorSound.stopsound()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

