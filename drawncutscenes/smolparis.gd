extends Control

var dialogue = [
#<<<<<<< HEAD
#=======
		" . . . and on the seventh year after the Second Cataclysm, the Eali came into power.",
		"''AND WHAT GOOD DID THE EALI BRING IN THE FIRST YEAR OF THEIR RULE?''",
		"They preserved the state of humanity and ensured our future through their strength and radical policy, Articles V and XX of the New Order,",
		"and the E.L.F. Acts, in particular.",
		"''VERY GOOD. AND WHAT DID THE E.L.F ACTS DO?''",
		"They solved both the problem of overpopulation and secured a constant work force. The strength of a nation can be measured by its production.",
		"''VERY GOOD. AND WHEN COUNCILOR MATTHEWS ENQUIRES ABOUT THE REASON FOR YOUR APPLICATION?''",
		"I am to say: ''I wish only to dedicate my name to the cause''.",
		" . . . VERY GOOD. SPOKEN LIKE A TRUE LOYALIST.",
		". . . Father? May I ask why you proposed the E.L.F Acts?",
		"''THAT . . . I SUPPOSE YOU ARE OLD ENOUGH TO UNDERSTAND NOW. VERY WELL. LET ME TELL YOU A STORY.''",
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
	$"continuesprite".visible = finished
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
	Transition.change_scene("res://drawncutscenes/Omelas.tscn")
