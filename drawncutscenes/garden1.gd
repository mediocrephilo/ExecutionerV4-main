extends Control

var dialogue = [
#<<<<<<< HEAD
#=======
		". . . Then let's do one a day.",
		"You've all got to work hard to raise your rank,", 
		"so let's have regular meetings. Don't worry, I'm here for you.",
		"Now, where should we start?",
		"Hmm . . . I suppose we might as well begin from the beginning.",
]
var reddialogue = [
		"i still don't understand the story about that bird. . ."
]
var greendialogue = [
		"REALLY? WE JUST FINISHED THAT UNIT, AND I THINK IT WAS PRETTY EASY."
]
var bluedialogue = [
		". . . l-let's just review e-everything, alright?"
]
var dialogue_index = 0
var dialogue_index1 = 0
var dialogue_index2 = 0
var dialogue_index3 = 0
var finished = false
var interact = false

func _ready():
	$Sprite.hide()
	yield(get_tree().create_timer(1), "timeout")
	load_dialogue()

func _process(_delta):
	#$"continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		if dialogue_index < 4:
			load_dialogue()
		if dialogue_index == 4 and dialogue_index1 == 0:
			load_reddialogue()
		if dialogue_index == 4 and dialogue_index1 == 1 and dialogue_index2 == 0:
			load_greendialogue()
		if dialogue_index == 4 and dialogue_index2 == 1 and dialogue_index3 == 0:
			load_bluedialogue()
		if dialogue_index == 4 and dialogue_index3 == 1:
			load_dialogue()
		if Input.is_action_just_pressed("ui_accept") and finished == true and dialogue_index == 5:
			Transition.change_scene("res://act3/scene3/normal2.tscn")

		
func load_dialogue():
	$Sprite.show()
	$RichTextLabel.show()
	$RichTextLabel2.hide()
	$RichTextLabel3.hide()
	$RichTextLabel4.hide()
	yield(get_tree().create_timer(0.5), "timeout")
	if dialogue_index < dialogue.size():

		$Type.play()
		finished = false
		$RichTextLabel.bbcode_text = dialogue[dialogue_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 2, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	
	else:
		queue_free()
func load_reddialogue():
	$Sprite.show()
	$RichTextLabel2.show()
	$RichTextLabel.hide()
	$RichTextLabel3.hide()
	$RichTextLabel4.hide()
	yield(get_tree().create_timer(0.5), "timeout")
	if dialogue_index1 < dialogue.size():

		$Type.play()
		finished = false
		$RichTextLabel2.bbcode_text = reddialogue[dialogue_index1]
		$RichTextLabel2.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel2, "percent_visible", 0, 1, 2, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
		dialogue_index -= 1
		dialogue_index1 +=1
	else:
		queue_free()
func load_greendialogue():
	$Sprite.show()
	$RichTextLabel3.show()
	$RichTextLabel2.hide()
	$RichTextLabel.hide()
	$RichTextLabel4.hide()
	yield(get_tree().create_timer(0.5), "timeout")
	if dialogue_index2 < dialogue.size():

		$Type.play()
		finished = false
		$RichTextLabel3.bbcode_text = greendialogue[dialogue_index2]
		$RichTextLabel3.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel3, "percent_visible", 0, 1, 2, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
		dialogue_index -= 1
		dialogue_index2 +=1
	else:
		queue_free()
func load_bluedialogue():
	$Sprite.show()
	$RichTextLabel2.hide()
	$RichTextLabel3.hide()
	$RichTextLabel.hide()
	yield(get_tree().create_timer(0.5), "timeout")
	if dialogue_index3 < dialogue.size():

		$Type.play()
		$RichTextLabel4.show()
		finished = false
		$RichTextLabel4.bbcode_text = bluedialogue[dialogue_index3]
		$RichTextLabel4.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel4, "percent_visible", 0, 1, 2, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
		dialogue_index -= 1
		dialogue_index3 +=1
	else:
		queue_free()
		
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()
	dialogue_index +=1
	


