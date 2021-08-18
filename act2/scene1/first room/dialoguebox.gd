extends Control

var dialogue = [
		"I  DON'T UNDERSTAND.",
		"I HAVEN'T THOUGHT OF HIM IN YEARS . . .",
		"WHAT WAS HIS NAME?",
]

var dialogue_index = 0
var number = 0
var finished = true
func _ready():
	#$continuesprite.hide()
	load_dialogue()
func _process(delta):
	#$"continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and finished == true and dialogue_index < 3:
		load_dialogue()
	if Input.is_action_just_pressed("ui_accept") and dialogue_index >= 3:
		$RichTextLabel.hide()
		$TextureRect.hide()
		#$continuesprite.hide()
		$Type.stop()
func load_dialogue():
	finished = false;
	$RichTextLabel.show()
	$TextureRect.show()
	$Type.play()
	$RichTextLabel.bbcode_text = dialogue[dialogue_index]
	$RichTextLabel.percent_visible = 0
	$Tween.interpolate_property(
		$RichTextLabel, "percent_visible", 0, 1, 2, 
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	$Tween.start()
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		$RichTextLabel.hide()
		$TextureRect.hide()
		#$continuesprite.hide()
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()
	dialogue_index += 1

