extends Area2D

var dialogue = [
		"GOVERNMENT PROPERTY: PROCEED AT YOUR OWN RISK"
]
var dialogue_index = 0
var number = 0
var finished = false
var canInteract = false
func _ready():
	$dialoguebox.hide()
	$AnimatedSprite.stop()


func _on_sign_body_entered(body):
	if body.name == "player" and number == 0:
		$AnimatedSprite.play("default")
		canInteract = true

func _on_sign_body_exited(body):
	if body.name == "player":
		$AnimatedSprite.stop()
		canInteract = false
func _process(delta):
	$"dialoguebox/continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and canInteract == true:
		load_dialogue()
		if number == 0:
			$dialoguebox/type.play()
func load_dialogue():
	$dialoguebox.show()
	$AnimatedSprite.stop()
	$dialoguebox/RichTextLabel.bbcode_text = dialogue[dialogue_index]
	$dialoguebox/RichTextLabel.percent_visible = 0
	$dialoguebox/Tween.interpolate_property(
		$dialoguebox/RichTextLabel, "percent_visible", 0, 1, 2, 
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	$dialoguebox/Tween.start()
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		$dialoguebox.hide()
		number += 1
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$dialoguebox/type.stop()
