extends Control

var dialogue = [
	"IT'S COMPLETELY BLANK . . .",
	". . . THERE WAS DEFINETLY SOMETHING HERE EARLIER . . .",

]
var dialogue_index = 0
var finished = false
var canInteract = false
func _ready():
	$TextureRect.hide()
	$continuesprite.hide()
	$RichTextLabel.hide()
func _on_Area2D4_body_entered(body):
	if body.name == "player":
		canInteract = true
func _on_Area2D4_body_exited(body):
	if body.name == "player":
		canInteract = false
func _process(delta):
	$"continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and canInteract == true:
		load_dialogue()
func load_dialogue():
	$TextureRect.show()
	$RichTextLabel.show()
	if dialogue_index < dialogue.size():
		finished = false
		$Type.play()
		$RichTextLabel.bbcode_text = dialogue[dialogue_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 2, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		queue_free()
	
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()
	dialogue_index += 1
