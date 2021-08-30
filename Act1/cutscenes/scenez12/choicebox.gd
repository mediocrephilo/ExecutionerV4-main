extends Control

var choice = [
	"[center] I DIDN'T FORGET YOU",
	"[center] WHY DO I KEEP SEEING YOU?"
]
var choice2 = [
	"[center] TRUST ME. IF I KNEW HOW, I WOULD",
	"[center] I THINK ONLY YOU CAN DO THAT"
]
var choice3 = [
	"[center] . . . ",
	"[center] I GUESS I DESERVED THAT"
]
var choice4 = [
	"[center] WHAT DO YOU WANT?",
	"[center] I DIDN'T MEAN TO KILL YOU"
]
var choice5 = [
	"[center] AND NOTHING BUT THE TRUTH?",
	"[center] I DON'T KNOW WHAT YOU MEAN"
]
var choice6 = [
	"[center] . . . I SHOULD JUST GO . . .",
	"[center] IT WAS NICE TO SPEAK TO YOU AGAIN, POLLY"
]
var choice7 = [
	"[center] REALLY? THIS IS MY STORY, IS IT?",
	"[center] EVEN IF THAT'S THE CASE . . . WHAT DO YOU WANT?"
]
var choice8 = [
	"[center] WHAT IS THAT SUPPOSED TO MEAN?",
	"[center] THIS IS JUST CRYPTIC NONSENSE. WHAT DO YOU WANT?"
]
var finished = false
var interact = false
var number = 0
var loading = 0
func _ready():
	$AnimatedSprite3.hide()
	$AnimatedSprite4.hide()
	$TextureRect.hide()
	yield(get_tree().create_timer(5), "timeout")
	load_dialogue(choice)
func _process(_delta):
	if Input.is_action_just_pressed("ui_up") and finished == true and number == 1:
		load_dialogue(choice2)
	if Input.is_action_just_pressed("ui_down") and finished == true and number == 1:
		load_dialogue(choice2)
	if Input.is_action_just_pressed("ui_up") and finished == true and number == 2:
		load_dialogue(choice3)
	if Input.is_action_just_pressed("ui_down") and finished == true and number == 2:
		load_dialogue(choice7)
	if Input.is_action_just_pressed("ui_up") and finished == true and number == 3:
		load_dialogue(choice4)
	if Input.is_action_just_pressed("ui_down") and finished == true and number == 3:
		load_dialogue(choice4)
	if Input.is_action_just_pressed("ui_up") and finished == true and number == 4:
		load_dialogue(choice5)
	if Input.is_action_just_pressed("ui_down") and finished == true and number == 4:
		load_dialogue(choice8)
	if Input.is_action_just_pressed("ui_up") and finished == true and number == 5:
		load_dialogue(choice6)
	if Input.is_action_just_pressed("ui_down") and finished == true and number == 5:
		load_dialogue(choice6)
	if Input.is_action_just_pressed("ui_up") and finished == true and number == 6:
		yield(get_tree().create_timer(4), "timeout")
		Transition.change_scene("res://Act1/playerscenes/scene5/black.tscn")
	if Input.is_action_just_pressed("ui_down") and finished == true and number == 6:
		yield(get_tree().create_timer(4), "timeout")
		Transition.change_scene("res://Act1/playerscenes/scene5/black.tscn")

func load_dialogue(choicenumber):
	yield(get_tree().create_timer(4), "timeout")
	$TextureRect.show()
	$RichTextLabel.show()
	$RichTextLabel2.show()
	$type.play()
	finished = false
	$RichTextLabel.bbcode_text = choicenumber[0]
	$RichTextLabel.percent_visible = 0
	$Tween.interpolate_property(
		$RichTextLabel, "percent_visible", 0, 1, 2, 
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	$Tween.start()
	$type.play()
	finished = false
	$RichTextLabel2.bbcode_text = choicenumber[1]
	$RichTextLabel2.percent_visible = 0
	$Tween.interpolate_property(
		$RichTextLabel2, "percent_visible", 0, 1, 2, 
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	$Tween.start()
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$type.stop()
	$AnimatedSprite3.show()
	$AnimatedSprite4.show()
	$TextureRect.show()
	number += 0.5
func _on_hhhh_tween_started(_object, _key):
	$RichTextLabel.hide()
	$RichTextLabel2.hide()
	$AnimatedSprite3.hide()
	$AnimatedSprite4.hide()
	$TextureRect.hide()
	finished = false
func _on_hhhh_tween_completed(_object, _key):
	finished = true

func _on_Tween_tween_started(_object, _key):
	$RichTextLabel.show()
	$RichTextLabel2.show()
