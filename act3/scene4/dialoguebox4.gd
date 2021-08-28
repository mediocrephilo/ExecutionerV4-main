extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var dialogue = [
		"''The took some moss and some dried mole meat, and carved small tubes to carry water for the journey.''",
		"''The star appeared as a bright speck in the mouth of their cave, and they set their path and began to fly.''",
		"''They flew and flew, but the speck never grew brighter, and their wings soon began to tire.''",
		"''However, Right as the pair were about to give up and return home, a bright, piercing glow blinded their eyes,''",
		"''and when their vision cleared, a ball of fire hung before them.''",
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
