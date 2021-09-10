extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	HorrorSound.playsound()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_Area2D_body_entered(body):
	if body.name == "player2":
		HorrorSound.fade_out()
		Transition.change_scene("res://Act1/playerscenes/scene5/black.tscn")
