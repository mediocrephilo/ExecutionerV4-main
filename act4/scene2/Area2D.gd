extends Area2D

var entered = false
onready var player = get_parent().get_node("player")


func _on_Area2D_body_entered(body):
	if body.name == "player":
		entered = true
