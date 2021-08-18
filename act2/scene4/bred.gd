extends Area2D

var dialogue = [
		"THE BREAD FILLS MY STOMACH, WARM AND ASHY, YET STILL I ACHE FOR MORE... MAYBE I SHOULD TAKE A PIECE WITH ME"
]
var dialogue_index = 0
var number = 0
var finished = false
var canInteract = false
func _ready():
	$Label.hide()
	$dialoguebox.hide()
	$AnimatedSprite.stop()
func _on_bred_body_entered(body):
	if body.name == "player" and number == 0:
		$Label.show()
		$AnimatedSprite.play("default")
		canInteract = true
func _on_bred_body_exited(body):
	if body.name == "player":
		$Label.hide()
		$AnimatedSprite.stop()
		canInteract = false
func _process(delta):
	$"dialoguebox/continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and canInteract == true and number == 0:
		$Label.hide()
		load_dialogue()
func load_dialogue():
	$dialoguebox.show()
	$AnimatedSprite.stop()
	if number == 0:
		$dialoguebox/Type.play()
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
		$dialoguebox/Type.queue_free()
func _on_Tween_tween_completed(_object, _key):
	finished = true
	if number == 0:
		$dialoguebox/Type.stop()
