extends Control

var dialogue = [
#<<<<<<< HEAD
#=======
		"It’s cold in here",
		"I don’t like sleeping on the ground. It makes my neck hurt.",
		"Every day the guards come in to feed us, but the bread they give us is as hard as rock.",
		"I wish someone would come with fruits.",
		"I wrote down the way I brought food without people noticing on a piece of paper back home. Maybe when father finds it he will come and give me fruits.",
		"I miss him",
		"I hope he will come see me before tomorrow... I just want to see him one last time",
		"At least the people here are nice. They smile when they see me but . . . they don’t look happy.",
		"They always tell me that I’m lucky, but I don’t get what they mean. Something about factories, something about E.L.F",
		"... ... ...",
		"but I’m scared. . . I don’t want to go . . . "
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
	if Input.is_action_just_pressed("ui_accept") and finished == true and dialogue_index == 11:
		Transition.change_scene("res://Act1/playerscenes/scenez11/SceneEleven.tscn")
		
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
	print("adsfdgf")
