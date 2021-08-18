extends Area2D

var canInteract = false
var transition = false

func _ready():
	$chairLabel.hide()
	$AnimatedSprite.stop()
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept") and canInteract == true and transition == true:
		Transition.change_scene("res://Act1/cutscenes/scene2/SceneTwoCutscene.tscn")
		
func _on_chair_body_entered(body):
	if body.name == "player":
		$AnimatedSprite.play("default")
		canInteract = true
func _on_chair_body_exited(body):
	if body.name == "player":
		$AnimatedSprite.stop()
		canInteract = false

func _on_dialoguebox_tree_exited():
	$chairLabel.show()
	$AnimatedSprite.stop()
	transition = true
