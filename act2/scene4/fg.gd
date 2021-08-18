extends Area2D

onready var eat = get_parent().get_node("bred")


func _ready():
	$CollisionShape2D.disabled = true
	
func _process(delta):
	if eat.finished == true:
		$CollisionShape2D.disabled = false
		

	


func _on_Area2D_body_entered(body):
	if body.name == "player":
			Transition.change_scene("res://act2/scene4/oshootcut.tscn")

