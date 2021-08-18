extends Node2D
var canInteract1 = false
var canInteract2 = false

func _ready():
	$hand/Label.hide()
	$hand2/Label.hide()

func _on_hand_body_entered(body):
	if body.name == "player":
		$hand/AnimatedSprite.play("default")
		$hand/Label.show()
		canInteract1 = true
		
func _on_hand_body_exited(body):
	if body.name == "player":
		$hand/AnimatedSprite.stop()
		$hand/Label.hide()
		canInteract1 = false
		
func _on_hand2_body_entered(body):
	if body.name == "player":
		$hand2/AnimatedSprite.play("default")
		$hand2/Label.show()
		canInteract2 = true


func _on_hand2_body_exited(body):
	if body.name == "player":
		$hand2/AnimatedSprite.stop()
		$hand2/Label.hide()
		canInteract2 = false
		
func _input(event):
	if Input.is_action_just_pressed("ui_interact") and canInteract1 == true:
		$hand/AnimatedSprite.play("hand")
		$player/playerSprite.play("dead")
	elif Input.is_action_just_pressed("ui_interact") and canInteract2 == true:
		$hand2/AnimatedSprite.play("hand")
		$player/playerSprite.play("dead")
