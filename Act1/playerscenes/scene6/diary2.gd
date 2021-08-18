extends Area2D
var canInteract = false
var dialogue = [
		"THERE'S SOMETHING IN HIS HAND"
]
var number = 0
var finished = false
var dialogue_index = 0
func _ready():
	$Label.hide()
	$dialoguebox.hide()
func _on_diary2_body_entered(body):
	if body.name == "player":
		$Label.show()
		$AnimatedSprite.play("default")
		canInteract = true


func _on_diary2_body_exited(body):
	if body.name == "player":
		$Label.hide()
		$AnimatedSprite.stop()
		canInteract = false
		
func _process(delta):
	$dialoguebox/continuesprite.visible = finished
	if Input.is_action_just_pressed("ui_accept") and canInteract == true and number == 0:
		$Label.hide()
		load_dialogue()
	elif Input.is_action_just_pressed("ui_accept") and canInteract == true and number == 1:
		Transition.change_scene("res://Act1/cutscenes/scene6/SceneSixCutscene2.tscn")
func load_dialogue():
	$dialoguebox.show()
	$AnimatedSprite.stop()
	$Type.play()
	$dialoguebox/RichTextLabel.bbcode_text = dialogue[dialogue_index]
	$dialoguebox/RichTextLabel.percent_visible = 0
	$dialoguebox/Tween.interpolate_property(
		$dialoguebox/RichTextLabel, "percent_visible", 0, 1, 2,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	$dialoguebox/Tween.start()
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		$AnimatedSprite.play("default")
		$dialoguebox.hide()
		$Label.show()
		$Type.queue_free()
		$Label.text = "take"
		number += 1
		
func _on_Tween_tween_completed(object, key):
	finished = true
	$dialoguebox/continuesprite.show()
	if number == 0:
		$Type.stop()
		
