extends Control

var dialogue = [
#<<<<<<< HEAD
#=======
		"IS...WAS THE BREAD THAT GOOD?",
		". . .",
		"LISTEN, I AM SORRY ABOUT WHAT HAPPENED",
		". . .",
		"REALLY, I HAD NO CHOICE",
		". . .",
		"WHY ARE YOU HERE? WHY DO I KEEP SEEING YOU? WHAT DO YOU WANT?",
		". . .",
		"BUT THINK ABOUT IT... IF IT WASN'T FOR ME, YOU WOULD BE SENT OFF TO JOIN E.L.F",
		"SO I DID SAVE YOU IN SOME STRANGE WAY",
		". . .",
		"YOU'RE RIGHT. IT'S A SORRY EXCUSE...",
		"I'VE JUST BEEN THINKING A LOT LATELY. I WISH I COULD TAKE BACK WHAT I DID",
		"I KNOW I DESERVE WHAT'S COMING FOR ME",
		"I SHOULD HAVE LISTENED TO HER",
		"CAN YOU AT LEAST TAKE MY APOLOGY?",
		". . . ",
		"FORGET IT. YOU CAN'T FORGIVE ME ANYWAYS"
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
