extends Area2D

var dialogue = [
		"Oh, a new prisoner. How unexpected!",
		"It's an honor to meet you. My name is Paris O'Brien.",
		"What's that look on your face for? Don't tell me you've never seen a ghost?",
		"Haha, don't worry, I won't hurt you.",
		"Why am I here? Well now . . . that's a hard question to answer.",
		"I seem to have forgotten quite a lot . . . to be honest, all I remember is my name.",
		". . . I-I'm sorry if this offends you, but . . . have we met before?",
		"No? Are you sure? You seem strangely . . . no, nevermind.",
		"What's that? You want to help me?",
		". . . Ha!",
		"No, I should be sorry for laughing. And how do you plan on helping me? You can't even help yourself.",
		"'Just trust me,' you say . . . it's been quite a while since I've heard those words.",
		". . . ",
		"Alright. I'll go along with you for now. It's not like I have anywhere else to be."
#>>>>>>> f0599f3fa4c9156509b07ab3f949457bf47c4d97
]

var dialogue_index = 0
var number = 0
var finished = false
var canInteract = false

func _ready():
	$dialoguebox.hide()
	$Label.hide()
	$AnimatedSprite.play("default")
	
func _on_paris_body_entered(body):
	if body.name == "player" and number == 0:
		$Label.show()
		$AnimatedSprite.play("default")
		canInteract = true

func _on_paris_body_exited(body):
	if body.name == "player":
		$Label.hide()
		canInteract = false

func _process(delta):
	$"dialoguebox/continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and canInteract == true and number ==0:
		$Label.hide()
		load_dialogue()
func load_dialogue():
	$dialoguebox.show()
	if dialogue_index < dialogue.size():

		#$Type2.play()
		$dialoguebox/RichTextLabel.bbcode_text = dialogue[dialogue_index]
		$dialoguebox/RichTextLabel.percent_visible = 0
		$dialoguebox/Tween.interpolate_property(
		$dialoguebox/RichTextLabel, "percent_visible", 0, 1, 2, 
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	else:
		queue_free()
		
	$dialoguebox/Tween.start()
	
	
	#if Input.is_action_just_pressed("ui_accept") and finished == true:
	#	dialoguebox.hide()
		#number += 1
	#	$Type2.queue_free()
func _on_Tween_tween_completed(_object, _key):
	finished = true
	#if number == 0:
	#	$Type2.stop()
	dialogue_index +=1
	
