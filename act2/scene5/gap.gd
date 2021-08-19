extends Area2D

var canInteract = false
func _ready():
	$Label.hide()
	
func _on_gap_body_entered(body):
	if body.name == "player":
		$Label.show()
		canInteract = true

func _on_gap_body_exited(body):
	if body.name == "player":
		$Label.hide()
		canInteract = false

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and canInteract == true:
		Transition.change_scene("res://act2/scene5/eyepuzzle.tscn")
