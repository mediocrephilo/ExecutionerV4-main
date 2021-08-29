extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var number = 0
var finished = false
var canInteract = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.hide()
	
func _on_tub_body_entered(body):
	if body.name == "player" and number == 0:
		canInteract = true
		$Label.show()
		$AnimatedSprite.play("default")
func _on_tub_body_exited(body):
	if body.name == "player":
		canInteract = false
		$Label.hide()
		$AnimatedSprite.stop()
