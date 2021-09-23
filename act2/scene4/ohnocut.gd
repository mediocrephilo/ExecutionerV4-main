extends Control

var dialogue = [
#<<<<<<< HEAD
#=======
		"[center]THIEF",
		"[center]WHERE ARE YOU GOING?",
		"[center]ACT INNOCENT ALL YOU LIKE, HERETIC",
		"[center]STEALING ON PRIVATE PROPERTY IS A PUNISHABLE OFFENCE? WHAT DO YOU THINK ABOUT THAT?",
		"[center]SHUT UP, SHUT UP WE'RE NOT LISTENING"
#>>>>>>> f0599f3fa4c9156509b07ab3f949457bf47c4d97
]
var dialogue_index = 0
var finished = false
var interact = false

func _ready():
	#$"continuesprite".hide()
	$AnimatedSprite.hide()
	$AnimatedSprite2.hide()
	yield(get_tree().create_timer(1), "timeout")
	load_dialogue()

func _process(_delta):
	#$"continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		load_dialogue()
		
func load_dialogue():
	$AnimatedSprite.show()
	$AnimatedSprite2.show()
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
