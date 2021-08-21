extends Control

var dialogue = [
#<<<<<<< HEAD
#=======
		"Hi! What's your name? I'm so happy I'm not the only kid!",
		"These meetings are so boring, right? There's nothing to play with!",
		"What's the point of all this, anyways? Who cares about the EALI? I want to play in the snow!",
		"It's all just boring adult stuff.",
		". . . Why do you look so scared? It's not like anyone can hear us",
		"Haha, you're such a scaredy cat! . . . It's funny! Do you want to be friends?",
		"Great! Now that we're friends, what do you want to do?",
		"Oh! I know! We should build a snowman!",
		"What, how do you not know how to make a snowman? Where have you been living? In the Crater?",
		"You study all day? Oh come on, that's so boring. You need to have some fun!",
		"Here, let me show you how to build a snowman!"

#>>>>>>> f0599f3fa4c9156509b07ab3f949457bf47c4d97
]
var dialogue_index = 0
var finished = false
var interact = false

func _ready():
	$Sprite.hide()
	$AnimatedSprite.play("1")
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
		if dialogue_index == 1:
			$AnimatedSprite.play("3")
		if dialogue_index == 4:
			$AnimatedSprite.play("2")
		if dialogue_index == 5:
			$AnimatedSprite.play("1")
		if dialogue_index == 7:
			$AnimatedSprite.play("3")
		if dialogue_index == 8:
			$AnimatedSprite.play("2")
		if dialogue_index == 9:
			$AnimatedSprite.play("3")
	
	else:
		queue_free()
	
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()
	dialogue_index +=1



func _on_Control_tree_exited():
		Transition.change_scene("res://act4/scene2/scene2.tscn")
