extends Area2D

var dialogue_index = 0
var finished = false
var canInteract = false
func _ready():
	$AnimatedSprite.stop()
func _on_Area2D4_body_entered(body):
	if body.name == "player" and dialogue_index == 0:
		$AnimatedSprite.play("default")
		canInteract = true
func _on_Area2D4_body_exited(body):
	if body.name == "player":
		$AnimatedSprite.stop()
		canInteract = false
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and canInteract == true:
		load_dialogue()
func load_dialogue():
	dialogue_index += 1
