extends Control


var dialogue = [
#<<<<<<< HEAD
#=======
		"I HAVEN'T . . . POLLY . . . IT'S BEEN YEARS . . .",
		"I HAVEN'T THOUGHT ABOUT IT IN SO LONG UNTIL NOW . . .",
		"WHY AM I SUDDENLY REMEBERING IT?",
		"WAIT A MINUTE, SOMETHING'S COMING . . ."
#>>>>>>> f0599f3fa4c9156509b07ab3f949457bf47c4d97
]
var dialogue_index = 0
var finished = false
var interact = false

func _ready():
	$"continuesprite".hide()
	$TextureRect.hide()
	yield(get_tree().create_timer(1), "timeout")
	load_dialogue()

func _process(_delta):
	$"continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		load_dialogue()
		
func load_dialogue():
	$TextureRect.show()
	yield(get_tree().create_timer(0.5), "timeout")
	if dialogue_index < dialogue.size():

		$type.play()
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
	$type.stop()
	dialogue_index +=1
