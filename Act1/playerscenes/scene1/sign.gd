extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dialogue_index = 0
var finished = false
var canInteract = false
func _ready():
	$AnimatedSprite.stop()
	$Label.hide()
func _on_Area2D3_body_entered(body):
	if body.name == "player" and dialogue_index == 0:
		$AnimatedSprite.play("default")
		$Label.show()
		canInteract = true
func _on_Area2D3_body_exited(body):
	if body.name == "player":
		$AnimatedSprite.stop()
		$Label.hide()
		canInteract = false
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and canInteract == true:
		load_dialogue()
func load_dialogue():
	$Label.hide()
	dialogue_index += 1
#func _process(delta):
#	pass

