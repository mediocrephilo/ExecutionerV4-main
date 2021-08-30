extends Control



var dialogue = [
#<<<<<<< HEAD
#=======
		"It'll be okay . . .",
		". . . I'll find a way, don't worry.",
		"Just focus on your studies . . . maybe it won't come to that."
		
]
var bluedialogue = [
	". . .  . . .",
	". . . i'm s-scared",
	"Do you think they would take me next?",
	"p-paris, don't let them t-take me too . . ."
]
var dialogue_index = 0
var dialogue_index3 = 0
var finished = false
var interact = false

func _ready():
	$Sprite.hide()
	yield(get_tree().create_timer(1), "timeout")
	load_bluedialogue()

func _process(_delta):
	#$"continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		if dialogue_index == 0 and dialogue_index3 < 2:
			load_bluedialogue()
		if dialogue_index == 0 and dialogue_index3 == 2:
			load_dialogue()
		if dialogue_index == 1 and dialogue_index3 == 2:
			load_bluedialogue()
		if dialogue_index == 1 and dialogue_index3 == 3:
			load_dialogue()
		if dialogue_index == 2 and dialogue_index3 == 3:
			load_dialogue()
	if dialogue_index == 3 and dialogue_index3 == 3 and Input.is_action_just_pressed("ui_accept"):
		Transition.change_scene("res://act3/scene3/normal4.tscn")
		
func load_dialogue():
	$Sprite.show()
	$RichTextLabel4.hide()
	yield(get_tree().create_timer(0.5), "timeout")
	if dialogue_index < dialogue.size():

		$Type.play()
		finished = false
		$RichTextLabel.show()
		$RichTextLabel.bbcode_text = dialogue[dialogue_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 2, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	
	else:
		queue_free()
		
func load_bluedialogue():
	$Sprite.show()
	$RichTextLabel.hide()
	yield(get_tree().create_timer(0.5), "timeout")
	if dialogue_index3 < dialogue.size():

		$Type.play()
		$RichTextLabel4.show()
		finished = false
		$RichTextLabel4.bbcode_text = bluedialogue[dialogue_index3]
		$RichTextLabel4.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel4, "percent_visible", 0, 1, 2, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
		dialogue_index -= 1
		dialogue_index3 +=1
	else:
		queue_free()
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()
	dialogue_index +=1


