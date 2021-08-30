extends Control
var dialogue = [
		"Oh, a new prisoner. How unexpected!",
		"It's an honor to meet you. My name is Paris O'Brien.",
		"What's that look on your face for? Don't tell me you've never seen a ghost?",
		"Haha, don't worry, I won't hurt you.",
		"Why am I here? Well now . . . that's a hard question to answer.",
		"I seem to have forgotten quite a lot . . . to be honest, all I remember is my name.",
		". . . I-I'm sorry if this offends you, but . . . have we met before?",
		"No? Are you sure? You seem strangely familiar",
		"What's that? You want to help me?",
		". . . Ha!",
		"No, I should be sorry for laughing. And how do you plan on helping me?", 
		"You can't even help yourself.",
		"'Just trust me,' you say . . . it's been quite a while since I've heard those words.",
		". . . ",
		"Alright. I'll go along with you for now. It's not like I have anywhere else to be."
#>>>>>>> f0599f3fa4c9156509b07ab3f949457bf47c4d97
]

var dialogue_index = 0
var number = 0
var finished = true
var canInteract = false

func _ready():
	$TextureRect.hide()
	$RichTextLabel.hide()
	$continuesprite.hide()

func _on_paris_body_entered(body):
	if body.name == "player" and number == 0:
		canInteract = true

func _on_paris_body_exited(body):
	if body.name == "player":
		canInteract = false
		
func _process(_delta):
	$"continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		load_dialogue()
		
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
	
	else:
		queue_free()
	
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()
	dialogue_index +=1
