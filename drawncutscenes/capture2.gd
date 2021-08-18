extends Control


var dialogue = [
#<<<<<<< HEAD
#=======
		"I HAVE BEEN SENT TO ESCORT THIS PRISONER BACK TO THE CAPITOL, SIR!",
		"YES SIR! IN LIGHT OF MY . . . RECENT ACHIEVEMENTS, THEY HAVE SENT ME TO ENSURE THE SUCCESSFUL RETURN AND EXECUTION OF THE TRAITOR",
		"YES . . . THANK YOU, SIR.",
		"-AND OUR LOYALTY GUIDE US."
		
]
var reddialogue = [
#<<<<<<< HEAD
#=======
		"EXECUTIONER 161. STATE YOUR PURPOSE.",
		" . . .  . . .  . . . ",
		"YOU HAVE NOT BEEN AUTHORIZED FOR THIS MISSION. DID THE BUREAU SEND YOU DIRECTLY?",
		"THIS IS HIGHLY UNORTHODOX . . . BUT I HAVE HEARD OF YOUR PROMOTION. CONGRAGULATIONS.",
		"VERY WELL. TAKE THE TRAITOR AND GO. MAY THE COUNCIL PROTECT US-"
		
]
var dialogue_index = 0
var dialogue_index2 = 0
var finished = false
var interact = false

func _ready():
	yield(get_tree().create_timer(0.5), "timeout")
	load_reddialogue()

func _process(_delta):
	#$"continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		if dialogue_index == 0 and dialogue_index2 == 1:
			load_dialogue()
		if dialogue_index == 1 and dialogue_index2 == 1:
			load_reddialogue()
		if dialogue_index == 1 and dialogue_index2 == 2:
			load_reddialogue()
		if dialogue_index == 1 and dialogue_index2 == 3:
			load_dialogue()
		if dialogue_index == 2 and dialogue_index2 == 3:
			load_reddialogue()
		if dialogue_index == 2 and dialogue_index2 == 4:
			load_dialogue()
		if dialogue_index == 3 and dialogue_index2 == 4:
			load_reddialogue()
		if dialogue_index == 3 and dialogue_index2 == 5:
			load_dialogue()
		if dialogue_index == 4 and dialogue_index2 == 5:
			Transition.change_scene("res://drawncutscenes/caprture3.tscn")
			
func load_dialogue():
	$Sprite.show()
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
	$RichTextLabel.hide()
	yield(get_tree().create_timer(0.5), "timeout")
	if dialogue_index2 < reddialogue.size():

		$Type.play()
		finished = false
		$RichTextLabel2.show()
		$RichTextLabel2.bbcode_text = reddialogue[dialogue_index2]
		$RichTextLabel2.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel2, "percent_visible", 0, 1, 2, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
		dialogue_index2 += 1
		dialogue_index -= 1
	else:
		queue_free()
	
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()
	dialogue_index +=1



func _on_Control_tree_exited():
	print("adsfdgf")
