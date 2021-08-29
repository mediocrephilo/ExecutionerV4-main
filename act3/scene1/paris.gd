extends Area2D

var number = 0
var finished = false
var canInteract = false

func _ready():
	$Label.hide()
	$AnimatedSprite.play("default")
	
func _on_paris_body_entered(body):
	if body.name == "player" and number == 0:
		$Label.show()
		$AnimatedSprite.play("default")
		canInteract = true

func _on_paris_body_exited(body):
	if body.name == "player":
		$Label.hide()
		canInteract = false

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and canInteract == true and number ==0:
		$Label.hide()
	
