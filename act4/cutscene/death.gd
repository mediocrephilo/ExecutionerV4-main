extends Control


var dialogue = [
#<<<<<<< HEAD
#=======
		"GOOD EVENING, EXECUTIONER 161.",
		"I HOPE YOU'VE HAD A PRODUCTIVE DAY. NOW, DO YOU KNOW THIS GIRL?",
		". . .  . . .  . . .",
		"ARE YOU CERTAIN? TRY AND REMEMBER. HER NAME IS 'CASSANDRA'",
		"SHE WAS ATTEMPTING TO ESCAPE THE CORPS. SHE HID IN A WAREHOUSE IN DISTRICT 4.",
		"YOU WERE THE ONLY ONE SHE TOLD ABOUT HER PLAN.",
		"DOES THAT SOUND FAMILIAR, 161?",
		". . .  . . .  . . .",
		"ALRIGHT. IF YOU INSIST ON NOT KNOWING HER, THEN KILLING HER SHOULDN'T BE A PROBLEM, RIGHT?",
		"AFTER ALL, EXECUTING TRAITORS IS YOUR DUTY."
		
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
	Transition.change_scene("res://act4/cutscene/death2.tscn")
