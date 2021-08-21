extends Control


var dialogue = [
#<<<<<<< HEAD
#=======
		". . . . . . . . . Hey.",
		"I'm alright, I know you didn't mean to hit me.",
		"I'm sorry, I know I shouldn't tell you what to do . . . I really was just trying to help you . . .",
		"What you did to those kids . . . and Paris... the people really hate you for that.",
		"I was just trying to keep you safe.",
		"Yes, I understand. The Corps is your thing, you get to make the decisions, but it just isn't for me",
		". . . I came here to say goodbye. I'm leaving.",
		"I don't know where, just away from the capitol, that's all. Anywhere's better than here.",
		"I tried, but . . . I dont want any part in this.",
		"I asked you to meet because . . . I wanted to ask if you would come with me.",
		"Ha . . . I know I'm being naive, but I had to ask, just to make sure.",
		"I-Listen. Don't ask me to stay . . . it'll kill me. You know that.",
		"Please, we could build a life together, no EALI, no Corps, no executions, just you and me.",
		". . .  . . .  . . .",
		"I knew you were going to say that. You're too dedicated, too invested . . . I wish I could blame you.",
		"It must be nice being a member of the Corps, if only to have a purpose. . . all I am is a disappointment. All I have is regret.",
		"Well, I guess this is goodbye then.",
		"If you won't come . . . you won't say anything right? Let me go in peace. Please."
		

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
		if dialogue_index == 5:
			$AnimatedSprite.play("2")
		if dialogue_index == 7:
			$AnimatedSprite.play("1")
		if dialogue_index == 9:
			$AnimatedSprite.play("2")
		if dialogue_index == 11:
			$AnimatedSprite.play("3")
		if dialogue_index == 13:
			$AnimatedSprite.play("1")
		if dialogue_index == 16:
			$AnimatedSprite.play("3")
	
	
	
	
	
	else:
		queue_free()
	
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()
	dialogue_index +=1



func _on_Control_tree_exited():
	Transition.change_scene("res://act4/scene5.tscn")
