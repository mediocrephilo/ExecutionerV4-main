extends Control


var dialogue = [
#<<<<<<< HEAD
#=======
		"Why did you have to do it yourself? What are you? An idiot?",
		"That man you killed was far too popular, think of what they're going to do to you!",
		"Why can't you just listen to me? I want to help you, to help the nation!",
		"What will the people do now? There's already an uprising!",
		"Yes! Right now! Swarms of people are barging into the capitol, Divisions 1 and 2 have already been deployed around the perimeter!",
		". . . I'm just so worried about you. I told you this was going to happen. I told you so!",
		"Well, what did you expect then? I kept telling you to not execute him!",
		"That girl . . . that boy . . . and Paris. That's three times you've disregarded my advice.",
		"So what if you had orders? You could've applied for reassignment! I wish no one had to die, but it's even worse that you-",
		"You just had to do it yourself!",
		"Yes, I know, you're better at politics than me. But how hard is it to get another person's advice through your thick skull?",
		"!",
		". . .  . . .  . . .",
		
		"You know what? if you want to act like that, fine.",
		"I was only trying to hep you.",

#>>>>>>> f0599f3fa4c9156509b07ab3f949457bf47c4d97
]
var dialogue_index = 0
var finished = false
var interact = false

func _ready():
	$Sprite.hide()
	$AnimatedSprite.play("2")
	yield(get_tree().create_timer(1), "timeout")
	load_dialogue()

func _process(_delta):
	#$"continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		load_dialogue()
		
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
		if dialogue_index == 2:
			$AnimatedSprite.play("3")
		if dialogue_index == 4:
			$AnimatedSprite.play("2")
		if dialogue_index == 5:
			$AnimatedSprite.play("1")
		if dialogue_index == 6:
			$AnimatedSprite.play("2")
		if dialogue_index == 7:
			$AnimatedSprite.play("3")
		if dialogue_index == 9:
			$AnimatedSprite.play("2")
		if dialogue_index == 11:
			$AnimatedSprite.play("4")
		if dialogue_index == 12:
			$AnimatedSprite.play("5")
		if dialogue_index == 13:
			$AnimatedSprite.play("1")
	
	
	
	
	
	
	
	
	else:
		queue_free()
	
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()
	dialogue_index +=1



func _on_Control_tree_exited():
	Transition.change_scene("res://act4/cutscene/title.tscn")
