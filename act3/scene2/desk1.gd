extends Area2D


var dialogue = [
		"Why are you squinting? Just go find the light switch"
]
var dialogue_index = 0
var number = 0
var finished = false
var canInteract = false
func _ready():
	gameSaver.save_game("res://Act3/scene2/bedroom1.tscn")
	$dialoguebox.hide()
	$Label.hide()
	$dialoguebox/continuesprite.hide()
func _on_chest_body_entered(body):
	if body.name == "player" and number == 0:
		canInteract = true
		$Label.show()
		$AnimatedSprite.play("default")
func _on_chest_body_exited(body):
	if body.name == "player":
		canInteract = false
		$Label.hide()
		$AnimatedSprite.stop()
func _process(delta):
	$"dialoguebox/continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and canInteract == true and number == 0:
		load_dialogue()
func load_dialogue():
	$dialoguebox.show()
	if number == 0:
		$dialoguebox/Type2.play()
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
		$dialoguebox/Type2.queue_free()
func _on_Tween_tween_completed(_object, _key):
	finished = true
	if number == 0:
		$dialoguebox/Type2.stop()
