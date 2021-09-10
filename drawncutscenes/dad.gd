extends Node2D

var dialogue = [
#<<<<<<< HEAD
#=======
		"''THIS PIECE CAME FROM ONE OF THE SURVIVING PRE-CATACLYSM TEXTS.''",
		"''WRITTEN BY A 'U. LE GUIN', OMELAS IS BOTH A BLUEPRINT AND A WARNING TO OUR DEVELOPING GOVERNMENT.''",
		"''DO NOT THINK EALI IS UNNESSECARILY CRUEL. SUFFERING AND JOY ARE TWO SIDES OF THE SAME COIN.''",
		"''WITHOUT ONE, THE OTHER CANNOT EXIST. YOU DO UNDERSTAND THIS, YES?''",
		". . .  . . . I do.",
		"''GOOD. YOU WILL MAKE ME PROUD.''",
		". . . Thank you, father. May I leave?",
		"''OF COURSE. TODAY'S LESSON IS FINISHED.''",
		"''. . .  . . .''",
		"''I WONDER . . . HAS THE SACRIFICE BEEN WORTH IT? I SUPPOSE THE ONLY THING I CAN DO IS LIVE, UNTIL I AM JUDGED GUILTY.''",
#>>>>>>> f0599f3fa4c9156509b07ab3f949457bf47c4d97
]

var dialogue_index = 0
var finished = false
var interact = false

func _ready():
	$Control/Sprite.hide()
	yield(get_tree().create_timer(1), "timeout")
	load_dialogue()

func _process(_delta):
	$"Control/continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		load_dialogue()
	if dialogue_index == 8 and Input.is_action_just_pressed("ui_accept") and finished == true:
		$AnimatedSprite2/AnimationPlayer.play("New Anim")
		
func load_dialogue():
	$Control/Sprite.show()
	yield(get_tree().create_timer(0.5), "timeout")
	if dialogue_index < dialogue.size():

		$Control/Type.play()
		finished = false
		$Control/RichTextLabel.bbcode_text = dialogue[dialogue_index]
		$Control/RichTextLabel.percent_visible = 0
		$Control/Tween.interpolate_property(
			$Control/RichTextLabel, "percent_visible", 0, 1, 2, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Control/Tween.start()
	
	else:
		queue_free()
	
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Control/Type.stop()
	dialogue_index +=1



func _on_Control_tree_exited():
	Transition.change_scene("res://act3/jailscenes/jail2.tscn")
