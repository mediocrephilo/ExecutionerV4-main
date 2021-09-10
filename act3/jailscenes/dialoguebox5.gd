extends Control
var dialogue = [
		". . . 161.",
		"I see now why you refused to tell me your name.",
		"That is why you know so much about me, isn't it?",
		"I must have told you everything... the location of our meetings, our plans, even my childhood during questioning",
		". . . I may have been a little harsh when speaking of the Corps before.",
		"But I stand by it. People join the Corps because of greed.",
		"And the citizens are the ones who suffer from their ambition.",
		"Executioners are the worst of them. Nothing is sacred to them, with their sickly gallows, especially not life.",
		"But . . . you do not strike me as someone who lives for glory.", 
		"If you are, well, it's not the first time I've been a bad judge of character.",
		"I hope you are not. In any case, you are my-our last chance.",
		"Do you still remember the story my father told me?",
		"The city of Omelas runs on the suffering of children. That is what keeps people like you in power.",
		"Will you celebrate, or will you fight? Leaving, at least for you, is not an option.",
		"I hope you will remember your decision when the time comes. Take this."
#>>>>>>> f0599f3fa4c9156509b07ab3f949457bf47c4d97
]
#var dialogue2 = [
#	"FIGHT",
#]
#var dialogue22 = [
#	"CELEBRATE",
#
#var dialogue3 = [
#	". . . I must confess, I am a little disappointed in your answer. Take this.",
#	"I hope, when the time comes, your decision will change.",
#>>>>>>> f0599f3fa4c9156509b07ab3f949457bf47c4d97
#]

var dialogue_index = 0
#var dialogue_index1 = 0
#var dialogue_index2 = 0
var number = 0
var finished = false
var canInteract = false

func _ready():
	finished = true
	$TextureRect.hide()
	$RichTextLabel.hide()
	$continuesprite.hide()
	$dialoguebox2.hide()

func _on_paris_body_entered(body):
	if body.name == "player" and number == 0:
		canInteract = true

func _on_paris_body_exited(body):
	if body.name == "player":
		canInteract = false
		
func _process(_delta):
	$"continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and finished == true and dialogue_index < 15:
		load_dialogue()
	if Input.is_action_just_pressed("ui_accept") and finished == true and dialogue_index == 15:
		Transition.change_scene("res://drawncutscenes/button.tscn")
		
	#if Input.is_action_just_pressed("ui_accept") and finished == true and dialogue_index == 15 and dialogue_index2 == 0:
	#	$dialoguebox2.show()
	#	load_dialogue2()
	#	load_dialogue22()
	#if Input.is_action_just_pressed("ui_up") and dialogue_index2 == 1:
	#	$dialoguebox2.hide()
	#	load_dialogue3()
	#if Input.is_action_just_pressed("ui_down") and dialogue_index2 == 1:
	#	$dialoguebox2.hide()
	#	load_dialogue()
	#if Input.is_action_just_pressed("ui_accept") and finished == true and dialogue_index1 == 1:
	#	load_dialogue()
	#if Input.is_action_just_pressed("ui_accept") and finished == true and dialogue_index == 12:
		#Transition.change_scene("")
	#if Input.is_action_just_pressed("ui_accept") and finished == true and dialogue_index3 == 2:
		#Transition.change_scene("")
		
func load_dialogue():
	$TextureRect.show()
	$RichTextLabel.show()
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
		dialogue_index +=1
	
		
#func load_dialogue3():
#	$TextureRect.show()
#	$RichTextLabel.show()
#	yield(get_tree().create_timer(0.5), "timeout")
#	if dialogue_index < dialogue.size():

#		$Type.play()
#		finished = false
#		$RichTextLabel.bbcode_text = dialogue3[dialogue_index1]
#		$RichTextLabel.percent_visible = 0
#		$Tween.interpolate_property(
#			$RichTextLabel, "percent_visible", 0, 1, 2, 
#			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
#		)
##		dialogue_index1 +=1
		
#func load_dialogue2():
#	yield(get_tree().create_timer(0.5), "timeout")
#	if dialogue_index < dialogue.size():

#		$Type.play()
#		finished = false
#		$dialoguebox2/RichTextLabel.bbcode_text = dialogue2[0]
##		$dialoguebox2/RichTextLabel.percent_visible = 0
	#	$dialoguebox2/Tween.interpolate_property(
	#		$dialoguebox2/RichTextLabel, "percent_visible", 0, 1, 2, 
	#		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	#	)
	#	$dialoguebox2/Tween.start()
	#	$dialoguebox2/AnimatedSprite.show()
	#	$dialoguebox2/AnimatedSprite2.show()
	#	$Type.stop()
	#	dialogue_index2 += 1
		

		
##	yield(get_tree().create_timer(0.5), "timeout")
	#if dialogue_index < dialogue.size():

	#	finished = false
	#	$dialoguebox2/RichTextLabel2.bbcode_text = dialogue22[0]
	#	$dialoguebox2/RichTextLabel2.percent_visible = 0
	#	$dialoguebox2/Tween.interpolate_property(
	#		$dialoguebox2/RichTextLabel2, "percent_visible", 0, 1, 2, 
	#		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	#	)
	#	$dialoguebox2/Tween.start()
	#	$dialoguebox2/AnimatedSprite.show()
	#	$dialoguebox2/AnimatedSprite2.show()

	
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()



