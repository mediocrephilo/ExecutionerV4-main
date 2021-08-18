extends Area2D
var canInteract = false
var image = false
func _ready():
	$Label.hide()
	$AnimatedSprite.stop()
	$Sprite.hide()
	$Sprite/Label2.hide()
func _on_paper2_body_entered(body):
	if body.name == "player":
		$Label.show()
		canInteract = true
		$AnimatedSprite.play("default")
		
func _on_paper2_body_exited(body):
	if body.name == "player":
		$Label.hide()
		canInteract = false
		$AnimatedSprite.stop()
		
func _input(event):
	if Input.is_action_just_pressed("ui_interact") and canInteract == true:
		$Sprite.show()
		$Sprite/Label2.show()
		image = true
		
	if Input.is_action_just_pressed("escape") and image == true:
		$Sprite.hide()
		$Sprite/Label2.hide()
	
