extends Control

var dialogue = [
		"WHY WOULD I DREAM OF THAT NOW?",
		"HAH . . . WHAT A CONVENIENT TIME FOR GUILT.",
		#WALK AROUND HH SAD BOI
		"IT'S HARD TO TELL THE TIME IN HERE.",
		"I WONDER HOW LONG IT'S BEEN . . . HOW LONG I HAVE LEFT",
]

var dialogue_index = 0
var number = 0
var finished = true
func _ready():
	$RichTextLabel.hide()
	$TextureRect.hide()
	$continuesprite.hide()
	load_dialogue()
	dialogue_index += 1
func _process(delta):
	$"continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and finished == true and dialogue_index <= 3:
		load_dialogue()
	if Input.is_action_just_pressed("ui_accept") and dialogue_index > 3:
		$RichTextLabel.hide()
		$TextureRect.hide()
		$continuesprite.hide()
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
		$continuesprite.hide()
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()
	dialogue_index += 1
