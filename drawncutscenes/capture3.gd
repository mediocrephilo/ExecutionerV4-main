extends Control


var dialogue = [
		"STOP. WE'LL REST HERE.",
		"Getting a little worn out, are we? I'll say, if the Eali Corps were full of people like you, it would've made my job much easier.",
		"Oh, don't look at me like that. Although, I suppose it's not a good idea to insult the executioner overseeing my, well, execution . . . ",
		"Not a very talkative one, huh? No matter. It's been a while since I've been able to talk so freely like this. Congragulations on the promotion, by the way.",
		"You know, I think this conversation is going fairly well, all things considered. I have a feeling you and I would've been great friends. Maybe in another lifetime.",
		". . . WHAT IS YOUR NAME?",
		"Oh, this brings me back to-Excuse me?",
		"I ASKED YOU FOR YOUR NAME. THE COUNCILORS CALL YOU TRAITOR, BUT I'M ASSUMING YOU PREFER TO BE CALLED SOMETHING ELSE.",
		". . . And what does my preference matter to an Eali dog?",
		"I . . . I TRY TO REMEMBER MY-THE PRISONERS. IT WOULD BE EASIER TO REMEMBER YOU IF I KNEW YOUR NAME.",
		". . . Ha! Haha-you're rather funny for an executioner, aren't you? Say, why don't you come join us. You must know getting rid of me won't solve anything, right?",
		"SORRY, I'LL HAVE TO PASS.",
		"Well, it was worth a try.",
		". . .  . . .",
		"My name is Paris.",
		"PARIS . . . THE FALLEN PRINCE.",
		"You know your chronology, I'm impressed.",
		"I WILL REMEMBER YOU, PARIS . . . TRAITOR.",
		"I'll hold you to that promise, Executioner 161."
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
	Transition.change_scene("res://act3/jailscenes/jail5.tscn")
