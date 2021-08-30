extends Control

var dialogue = [
	"[center] i am still here! [/center]",
]

var dialogue2 = [
	"[center] maybe now you can make me leave? [/center]"
]

var dialogue3 = [
	"[center] that is so rude! you were always so mean . . . i hate you! [/center]",
	"[center] and why should I do you a favor? [/center]",
]

var dialogue4 = [
	"[center] well that's just rude. i was real! no thanks to you.",
	"[center] but i guess, since you still remember me, i don't hate you as much. [/center]",
]

var dialogue5 = [
	"[center] you're a liar! a liar and a murderer!",
	"[center] oh we had so much fun! until you, well . . ."
]

var dialogue6 = [
	"[center] i want you to tell the truth.",
	"[center] well, even if you did, you wouldn't remember."
]

var dialogue7 = [
	"[center] now you're getting it!",
	"[center] you will! hehe."
]

var dialogue8 = [
	"[center] mean, mean, we're so mean! hehe!",
	"[center] i say, i say we have a party! all of us together!"
]

var dialogue9 = [
	"[center] bye bye! i hope you die!",
	"[center] no it wasn't! bye bye!"
]
var dialogue_index = 0
var finished = false
var interact = false
var loading = 0

func _ready():
	$TextureRect.hide()
	yield(get_tree().create_timer(5), "timeout")
	load_dialogue(dialogue, 0)

func _process(_delta):
	if Input.is_action_just_pressed("ui_up") and dialogue_index == 1:
		load_dialogue(dialogue2, 0)
	if Input.is_action_just_pressed("ui_down") and dialogue_index == 1:
		load_dialogue(dialogue2, 0)
	if Input.is_action_just_pressed("ui_up") and dialogue_index == 2:
		load_dialogue(dialogue3, 0)
		loading = 0
	if Input.is_action_just_pressed("ui_down") and dialogue_index == 2:
		load_dialogue(dialogue3, 1)
		loading = 1
	if Input.is_action_just_pressed("ui_up") and dialogue_index == 3 and loading == 0:
		load_dialogue(dialogue4, 0)
	if Input.is_action_just_pressed("ui_down") and dialogue_index == 3 and loading == 0:
		load_dialogue(dialogue4, 1)
	if Input.is_action_just_pressed("ui_up") and dialogue_index == 3 and loading == 1:
		load_dialogue(dialogue5, 0)
	if Input.is_action_just_pressed("ui_down") and dialogue_index == 3 and loading == 1:
		load_dialogue(dialogue5, 1)
	if Input.is_action_just_pressed("ui_up") and dialogue_index == 4:
		load_dialogue(dialogue6, 0)
		loading = 0
	if Input.is_action_just_pressed("ui_down") and dialogue_index == 4:
		load_dialogue(dialogue6, 1)
		loading = 1
	if Input.is_action_just_pressed("ui_up") and dialogue_index == 5 and loading == 0:
		load_dialogue(dialogue7, 0)
	if Input.is_action_just_pressed("ui_down") and dialogue_index == 5 and loading == 0:
		load_dialogue(dialogue7, 1)
	if Input.is_action_just_pressed("ui_up") and dialogue_index == 5 and loading == 1:
		load_dialogue(dialogue8, 0)
	if Input.is_action_just_pressed("ui_down") and dialogue_index == 5 and loading == 1:
		load_dialogue(dialogue8, 1)
	if Input.is_action_just_pressed("ui_up") and dialogue_index == 6:
		load_dialogue(dialogue9, 0)
	if Input.is_action_just_pressed("ui_down") and dialogue_index == 6:
		load_dialogue(dialogue9, 1)

func load_dialogue(dialogue_type, type):
	$TextureRect.show()
	$type.play()
	finished = false
	$RichTextLabel.bbcode_text = dialogue_type[type]
	$RichTextLabel.percent_visible = 0
	$hhhh.interpolate_property(
		$RichTextLabel, "percent_visible", 0, 1, 2, 
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	$hhhh.start()

func _on_hhhh_tween_completed(_object, _key):
	$type.stop()
	dialogue_index +=1

func _on_Tween_tween_completed(_object, _key):
	finished = true
