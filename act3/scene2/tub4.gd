extends Area2D


var number = 0
var finished = false
var canInteract = false

# Called when the node enters the scene tree for the first time.
func _ready():
	gameSaver.save_game("res://Act3/scene2/bathroom4.tscn")
	$Label.hide()
func _process(delta):
	if canInteract == true and Input.is_action_just_pressed("ui_accept"):
		Transition.change_scene("act3/scene2/bathtub.tscn")
		
func _on_tub_body_entered(body):
	if body.name == "player":
		canInteract = true
		$Label.show()
		$AnimatedSprite.play("default")
func _on_tub_body_exited(body):
	if body.name == "player":
		canInteract = false
		$Label.hide()
		$AnimatedSprite.stop()
