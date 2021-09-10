extends Control

var dialogue = [
#<<<<<<< HEAD
#=======
		"YOU SEE, THIS ENTIRE INCIDENT HAS MADE YOU QUITE SUSPICIOUS IN THE EYES OF THE COUNCIL.",
		"LYING TO US NOW MIGHT MAKE YOU A CO-CONSPIRATOR.",
		"ON THE OTHER HAND, EXECUTE YOUR 'FRIEND' HERE, AND YOU MAY BE FORGIVEN.",
		"THE CHOICE IS YOURS. EITHER WAY, THE GIRL WILL DIE.",
		"NOW. WILL YOU DO YOUR JOB, OR WILL YOU STEP BACK, A COWARD?"
		
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
	Transition.change_scene("res://drawncutscenes/deadlol.tscn")
