extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	ForestSound.playsound()
# Called when the node enters the scene tree for the first time.
func _on_exiting_body_entered(body):
	if body.name == "player":
		Transition.change_scene("res://Act1/playerscenes/scenez10/SceneTen.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
