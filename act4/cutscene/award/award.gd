extends Control


var dialogue = [
#<<<<<<< HEAD
#=======
		"Well, it's your big day! Are you excited?",
		"Just think about it. A member of the Corps? Everyone's going to be scrambling to get your autograph!",
		"You're welcome! I'm so happy for you!",
		". . . No, I didn't get in . . .",
		"Maybe next time . . . it's okay! I'll try even harder.",
		"Don't worry, it's going to be fine. How can it not be when I'm here?",
		

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
		if dialogue_index == 3:
			$AnimatedSprite.play("2")
		if dialogue_index == 4:
			$AnimatedSprite.play("3")
		if dialogue_index == 5:
			$AnimatedSprite.play("1")
	
	
	else:
		queue_free()
	
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()
	dialogue_index +=1



func _on_Control_tree_exited():
	Transition.change_scene("res://act4/scene4.tscn")
