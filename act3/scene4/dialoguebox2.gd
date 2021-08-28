extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var dialogue = [
		"Hmm . . . so there is some hidden meaning in this text. I'll continue reading then.",
		"''The bird was happy, even though he was lonely.''",
		"''There was no one else on his little star: the heat had long burned away the trees and grass and other animals on the surface.''",
		"''On the entire star, there was no one Left but him.''",
]
var dialogue_index = 0
var finished = false
var canInteract = false
func _ready():
		load_dialogue()
		
func _process(_delta):
	$"continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and finished == true:
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
