extends Control

var dialogue = [
#<<<<<<< HEAD
#=======
		". . . WHERE AM I?",
		"A FOREST . . . I REMEMBER THIS PLACE",
		"''THE RIVER THE FOREST THE HANGMAN'S NOOSE''",
		"''RETURN TO WHERE YOU SPREAD YOUR ROOTS''",
		"WHAT A STRANGE DREAM THIS IS"
#>>>>>>> f0599f3fa4c9156509b07ab3f949457bf47c4d97
]
var dialogue_index = 0
var finished = false
var interact = false

func _ready():
	$"continuesprite".hide()
	yield(get_tree().create_timer(2), "timeout")
	load_dialogue()
	yield(get_tree().create_timer(5), "timeout")
	$SkipRect/AnimationPlayer.play("fade")
	yield(get_tree().create_timer(1), "timeout")
	$SkipRect.hide()
	$SkipRect/AnimationPlayer.play_backwards("fade")
	
func _process(_delta):
	$"continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		load_dialogue()
		$SkipRect.show()
		
func load_dialogue():
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

