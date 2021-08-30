extends Control


var dialogue = [
#<<<<<<< HEAD
#=======
		"Hey, good job on the physical today!",
		"I saw you! You were so fast!",
		"No, really, I think you're Coach Dover's favorite",
		"What? . . . I-I did alright, I guess . . .",
		"I don't really want to talk about it.",
		"No, it's okay, I just did really bad.",
		"I'm just bad at physicals in general. . . I'm not strong, or fast, and I'm pretty clumsy too.",
		"I'm way better at art and music though . . . but the Corps don't care as much for those.",
		"Actually. . . I might have a chance at joining the EALI Philharmonic Orchestra, but I heard it's too competitive. . .",
		". . .   . . .   . . .",
		"Honestly, I'm just scared . . . My parents would be so disappointed in me if I don't at least make it into the Scouts",
		"It should be easy for you though, you're number one in almost every test! I wish I could be more like you . . .",
		". . . Yeah... I guess I should train some more. . .",
		"It's just that I can't focus at all on Corps training! It's so boring, and all the running makes me sick . . .",
		"It's okay . . . maybe I'll better when I'm older!"

#>>>>>>> f0599f3fa4c9156509b07ab3f949457bf47c4d97
]
var dialogue_index = 0
var finished = false
var interact = false

func _ready():
	$Sprite.hide()
	$AnimatedSprite.play("3")
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
			$AnimatedSprite.play("1")
		if dialogue_index == 5:
			$AnimatedSprite.play("2")
		if dialogue_index == 8:
			$AnimatedSprite.play("1")
		if dialogue_index == 9:
			$AnimatedSprite.play("2")
		if dialogue_index == 11:
			$AnimatedSprite.play("1")
		if dialogue_index == 12:
			$AnimatedSprite.play("3")
	
	
	else:
		queue_free()
	
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()
	dialogue_index +=1



func _on_Control_tree_exited():
	Transition.change_scene("res://act4/scene3/scene3.tscn")
