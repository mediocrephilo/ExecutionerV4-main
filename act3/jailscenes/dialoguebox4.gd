extends Control
var dialogue = [
		"I knew it! I knew I had memories of the rebellion, but it wouldn't have been the first time my mind played tricks on me.",
		"I am a coward by nature, and I was afraid of thinking of it, for fear that when I came to my senses, it would have given me a false hope.",
		"But then again, we are not out of the fog just yet, are we. Tell me, did we succeed?",
		"No! Stop. Do not tell me. Let me witness the result of our fight, even if it was for nothing.",
		"The fact that we tried proves to me that not all of humanity has descended into darkness.",
		"It would be a disservice to my brothers and sisters if I shied away from the end now.",
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
