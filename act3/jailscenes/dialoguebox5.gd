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
		"Will you celebrate, or will you fight? Leaving, at least for you, is not an option.",
		"I hope you will remember your decision when the time comes. Take this."
#>>>>>>> f0599f3fa4c9156509b07ab3f949457bf47c4d97
]
var dialogue2 = [
	"FIGHT",
]
var dialogue22 = [
	"CELEBRATE",
]
var dialogue3 = [
	". . . I must confess, I am a little disappointed in your answer. Take this.",
	"I hope, when the time comes, your decision will change.",
#>>>>>>> f0599f3fa4c9156509b07ab3f949457bf47c4d97
]

var dialogue_index = 0
var dialogue_index1 = 0
var number = 0
var finished = true
var canInteract = false

func _ready():
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
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		load_dialogue()
	if Input.is_action_just_pressed("ui_accept") and finished == true and dialogue_index == 11:
		$dialoguebox2.show()
		load_dialogue2()
		load_dialogue22()
		if Input.is_action_just_pressed("ui_up"):
			load_dialogue3()
		if Input.is_action_just_pressed("ui_down"):
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
		dialogue_index +=1
	
	else:
		queue_free()
		
func load_dialogue3():
	$TextureRect.show()
	$RichTextLabel.show()
	yield(get_tree().create_timer(0.5), "timeout")
	if dialogue_index < dialogue.size():

		$Type.play()
		finished = false
		$RichTextLabel.bbcode_text = dialogue3[dialogue_index1]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 2, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
		dialogue_index1 +=1
	
	else:
		queue_free()
		
func load_dialogue2():
	$TextureRect.show()
	$RichTextLabel.show()
	yield(get_tree().create_timer(0.5), "timeout")
	if dialogue_index < dialogue.size():

		$Type.play()
		finished = false
		$dialoguebox/RichTextLabel.bbcode_text = dialogue2[0]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 2, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
		
	else:
		queue_free()
func load_dialogue22():
	$TextureRect.show()
	$RichTextLabel2.show()
	yield(get_tree().create_timer(0.5), "timeout")
	if dialogue_index < dialogue.size():

		$Type.play()
		finished = false
		$RichTextLabel2.bbcode_text = dialogue22[0]
		$RichTextLabel2.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel2, "percent_visible", 0, 1, 2, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	
	else:
		queue_free()
	
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()
