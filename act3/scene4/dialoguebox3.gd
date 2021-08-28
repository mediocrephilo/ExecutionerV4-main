extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var dialogue = [
		"''He was so lonely that one day, he sent a message to his family, still living in their old, dark cavern.''",
		"''Mother, Father, he wrote. 'I have been on this star since early Tagelion. Why don't you pay me a visit?'''",
		"''Overjoyed at the message, his parents began planning for their trip Right away.''",
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
