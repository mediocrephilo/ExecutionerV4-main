extends Control


var dialogue = [
#<<<<<<< HEAD
#=======
	"[center] long time no see [/center]",
	"[center] you sure took your sweet time getting here [/center]",
#>>>>>>> f0599f3fa4c9156509b07ab3f949457bf47c4d97
]
var dialogue2 = [
	"[center] . . . [/center]",
	"[center] coffee? again?",
	"[center] I swear your eating habits are going to send you to an early grave",
]
var dialogue3 = [
	"[center] I know right? It was a gift",
	"[center] . . . your hair's getting rather long, isn't it?",
	"[center] it's blocking your eyes, and you have beautiful eyes . . . why don't you get it cut?",	
]
var dialogue4 = [
	"[center] oh well, I had to try . . . it's beautiful out today, don't you think?",
	"[center] . . . ",
	"[center] I wish things could stay like this forever . . .",	
]
var dialogue5 = [
	"[center] can I ask you something?",
]
var dialogue6 = [
	"[center] what would make someone do something they don't believe in?",
]
var dialogue7 = [
	"[center] what would it take? for someone to turn their back on the people they swore to protect?",
]
var dialogue8 = [
	"[center] no other choice, huh, . . . is that why you did it?",
	"[center] or did you truly believe he deserved to die?"
]
var dialogue_index = 0
var dialogue_line = 0
var finished = false
var interact = false

func _ready():
	$AnimatedSprite.play("happ")
	yield(get_tree().create_timer(1), "timeout")
	load_dialogue(dialogue, 0)

func _process(_delta):
	#$"continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and finished == true and dialogue_index == 1:
		load_dialogue(dialogue, 1)
	if (Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down")) and finished == true and dialogue_index == 2:
		load_dialogue(dialogue2, 0)
	if Input.is_action_just_pressed("ui_accept") and finished == true and dialogue_index == 3:
		load_dialogue(dialogue2, 1)
	if Input.is_action_just_pressed("ui_accept") and finished == true and dialogue_index == 4:
		load_dialogue(dialogue2, 2)
	if (Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down")) and finished == true and dialogue_index == 5:
		load_dialogue(dialogue3, 0)
	if Input.is_action_just_pressed("ui_accept") and finished == true and dialogue_index == 6:
		load_dialogue(dialogue3, 1)
	if Input.is_action_just_pressed("ui_accept") and finished == true and dialogue_index == 7:
		load_dialogue(dialogue3, 2)
	if (Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down")) and finished == true and dialogue_index == 8:
		load_dialogue(dialogue4, 0)
	if Input.is_action_just_pressed("ui_accept") and finished == true and dialogue_index == 9:
		load_dialogue(dialogue4, 1)
	if Input.is_action_just_pressed("ui_accept") and finished == true and dialogue_index == 10:
		load_dialogue(dialogue4, 2)
	if (Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down")) and finished == true and dialogue_index == 11:
		load_dialogue(dialogue5, 0)
	if (Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down")) and finished == true and dialogue_index == 12:
		load_dialogue(dialogue6, 0)
	if Input.is_action_just_pressed("ui_accept") and finished == true and dialogue_index == 13:
		load_dialogue(dialogue7, 0)
	if Input.is_action_just_pressed("ui_up") and dialogue_index == 14:
		load_dialogue(dialogue8, 0)
	if Input.is_action_just_pressed("ui_accept") and finished == true and dialogue_index == 15:
		load_dialogue(dialogue8, 1)
	if Input.is_action_just_pressed("ui_accept") and finished == true and dialogue_index == 16:
		Transition.change_scene("res://Act2/cutscenes/cellscene.tscn")
	
func load_dialogue(dialogue_type, type):
	dialogue_line = 0
	yield(get_tree().create_timer(0.5), "timeout")
	if dialogue_line < dialogue_type.size():
		$Type.play()
		finished = false
		$RichTextLabel.bbcode_text = dialogue_type[type]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 2, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
		if dialogue_index == 5:
			$AnimatedSprite.play("blush")
		if dialogue_index == 6:
			$AnimatedSprite.play("happ")
		if dialogue_index == 8:
			$AnimatedSprite.play("kalm")
		if dialogue_index == 12:
			$AnimatedSprite.play("1")
		if dialogue_index == 13:
			$AnimatedSprite.play("2")
		if dialogue_index == 14:
			$AnimatedSprite.play("3")
		if dialogue_index == 15:
			$AnimatedSprite.play("4")
	else:
		queue_free()
	
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()
	dialogue_index +=1
	dialogue_line +=1


func _on_Control_tree_exited():
	Transition.change_scene("res://act2/cutscenes/title.tscn")
