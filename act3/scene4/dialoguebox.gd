extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dialogue = [
		"Let's see . . .",
		"Well, that's strange.",
		"The next few pages seem to be some sort of fairy tale.",
		"''Once upon a time, on a star far, far away, there lived a little bird.''",
		"''He had wings of gold that shone bright in the dark around him and talons of flame that protected him from both heat and frost.''",
		"''To live on this star, the little bird had Left behind the soft rock and dark ceiling of his cave, and promised to never return.''",
		"The first page ends there . . . perhaps this is some sort of convoluted clue?"
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

