extends Control



var dialogue = [
		". . . And what exactly am I under arrest for?",
]
var reddialogue = [
#<<<<<<< HEAD
#=======
		"HALT! IF YOU CONTINUE RESISTING, WE WILL BE FORCED TO SEDATE YOU",
		"COUNCILOR BENEDICTION HAS CHARGED YOU WITH CONSPIRACY TO COMMIT TREASON, MURDER, AND 16 OTHER OFFENSES",
		"THE EALI ARE A FAIR AND JUST AUTHORITY, AND YOU HAVE A RIGHT TO SPEAK IN YOUR DEFENSE TO A LESSER COUNCIL",
		"COME WITH US PEACEFULLY, AND YOUR LIFE MAY NOT YET BE FORFEIT",
		
]
var dialogue_index = 0
var dialogue_index2 = 0
var finished = false
var interact = false

func _ready():
	$Sprite.hide()
	$RichTextLabel2.show()
	yield(get_tree().create_timer(1), "timeout")
	load_reddialogue()

func _process(_delta):
	#$"continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		if dialogue_index2 == 1 and dialogue_index == 0:
			load_dialogue()
		if dialogue_index2 >= 1 and dialogue_index == 1:
			load_reddialogue()
		if dialogue_index2 == 4:
			get_tree().change_scene("res://drawncutscenes/capture2.tscn")
		
func load_dialogue():
	$Sprite.show()
	$RichTextLabel.show()
	$RichTextLabel2.hide()
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
		
func load_reddialogue():
	$Sprite.show()
	$RichTextLabel.hide()
	yield(get_tree().create_timer(0.5), "timeout")
	if dialogue_index2 < reddialogue.size():

		$Type.play()
		finished = false
		$RichTextLabel2.show()
		$RichTextLabel2.bbcode_text = reddialogue[dialogue_index2]
		$RichTextLabel2.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel2, "percent_visible", 0, 1, 2, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
		dialogue_index2 += 1
		dialogue_index -= 1
	else:
		queue_free()
	
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()
	dialogue_index +=1



func _on_Control_tree_exited():
	print("adsfdgf")
