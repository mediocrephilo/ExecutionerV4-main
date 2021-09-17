extends Control

var dialogue = [
	
		"What do you guys think the moral of the story is?",
		"I mean, there is a sample paragraph, but that doesn't mean we can't make our own morals",
		"I think that perhaps. . . It's telling us that good intentions can lead to bad outcomes",
		"The parents wanted to put out the fire to save their son, but ended up killing him instead.",
		". . . Well, I mean. . .",
		"Nevermind, you're right. Let's meet again in a week."
]
var reddialogue = [
		"i think my teacher said to only write about the morals that they gave us."
]
var bluedialogue = [
		". . . s-shouldn't we just go with what the teacher said?"
]
var dialogue_index = 0
var dialogue_index1 = 0
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
		if dialogue_index == 4 and dialogue_index3 == 0 and dialogue_index1 == 1:
			load_dialogue()
		if dialogue_index == 5 and dialogue_index3 == 0:
			load_bluedialogue()
		if dialogue_index >= 5 and dialogue_index3 == 1:
			load_dialogue()
	if Input.is_action_just_pressed("ui_accept") and finished == true and dialogue_index == 7:
		Transition.change_scene("res://act3/scene3/normal3.tscn")
		
func load_dialogue():
	$Sprite.show()
	$RichTextLabel2.hide()
	$RichTextLabel4.hide()
	yield(get_tree().create_timer(0.5), "timeout")
	if dialogue_index < dialogue.size():

		$Type.play()
		finished = false
		$RichTextLabel.show()
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

func load_bluedialogue():
	$Sprite.show()
	$RichTextLabel2.hide()
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


func _on_Control_tree_exited():
	Transition.change_scene("res://act3/scene3/normal3.tscn")
