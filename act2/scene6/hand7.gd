extends Area2D
var canInteract = false
var entered = false

onready var player = get_parent().get_node("player")

func _ready():
	$Label.hide()


func _on_hand7_body_entered(body):
	if body.name == "player":
		$Label.show()
		canInteract = true
		$AnimatedSprite.play("default")

func _on_hand7_body_exited(body):
	if body.name == "player":
		$Label.hide()
		canInteract = false
		$AnimatedSprite.stop()

func _input(event):
	if Input.is_action_just_pressed("ui_accept") and canInteract == true:
		entered = true
		$AnimatedSprite.play("hand")
		GameOver.transition("res://act2/scene5/scene5.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")
		
