extends Area2D

var finished = false
var canInteract = false
var number = 0;

func _ready():
	$AnimatedSprite.stop()
func _on_chest_body_entered(body):
	if body.name == "player" and number == 0:
		$AnimatedSprite.play("default")
		canInteract = true
func _on_chest_body_exited(body):
	if body.name == "player":
		$AnimatedSprite.stop()
		canInteract = false
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and canInteract == true:
		load_dialogue()
		number += 1
func load_dialogue():
	$AnimatedSprite.stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
