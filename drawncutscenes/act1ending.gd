extends Control

var dialogue = [
#<<<<<<< HEAD
#=======
		"... Elphabon, XX",
		"It’s been so long since father visited.",
		"I don't think he's allowed to see me again. Ever. . .",
		"The guard with the long black hair came in today and took Cindy." , 
		". . . She hasn't come back. Maybe she never will",
		"I think she's dead. Arthur too. And mother. And that little boy hanging from the tree. The guard with the long black hair killed them all.",
		"I'm afraid I might be next.",
		"The black haired guard is mean! They're so mean! I hate them. They don't talk to me. They won't even look at me! ",
		"At least the other people don't bother me. They smile when they see me but . . . they don’t look happy.",
#>>>>>>> f0599f3fa4c9156509b07ab3f949457bf47c4d97
]
var dialogue_index = 0
var finished = false
var interact = false

func _ready():
	$Sprite.hide()
	yield(get_tree().create_timer(1), "timeout")
	load_dialogue()

func _process(_delta):
	#$"continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		load_dialogue()
	if Input.is_action_just_pressed("ui_accept") and finished == true and dialogue_index == 9:
		Transition.change_scene("res://drawncutscenes/factory.tscn")
		
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
	
	else:
		queue_free()
	
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()
	dialogue_index +=1



func _on_Control_tree_exited():
	pass
