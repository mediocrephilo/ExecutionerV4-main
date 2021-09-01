extends Control
var dialogue = [
		". . . 161.",
		"I see now why you refused to tell me your name.",
		". . . I may have been a little harsh when speaking of the Corps.",
		"But I stand by it. People join the Corps for personal greed.",
		"And the people are the ones who suffer from their ambition.",
		"Executioners are the worst of them. Nothing is sacred to them, with their sickly gallows, especially not life.",
		"But . . . you do not strike me as someone who struggles with glory.", 
		"If you are, well, it's not the first time I've been a bad judge of character.",
		"In any case, you are my-our last chance.",
		"Do you still remember the story my father told me?",
		"Will you stay, or will you fight? Leaving, at least for you, is not an option."
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
