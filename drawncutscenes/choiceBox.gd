extends Control

var choice = [
	"[center] SOMETHING CAME UP . . . I'LL TAKE THE USUAL",
	"[center] MY BAD. CAN I GET SOME COFFEE?"
]
var choice2 = [
	"[center] GOOD. BY THE WAY, THAT TIE LOOKS GREAT ON YOU",
	"[center] OKAY, MOM. . . THAT'S A NICE SHIRT"
]
var choice3 = [
	"[center] DON'T.",
	"[center] I . . . REALLY WISH YOU'D DROP THIS."
]
var choice4 = [
	"[center] . . .",
	"[center] ME TOO . . ."
]
var choice5 = [
	"[center] . . .",
	"[center] YOU JUST DID"
]
var choice6 = [
	"[center] NO CHOICE.",
]

var finished = false
var interact = false
var number = 0
var loading = 0
func _ready():
	$AnimatedSprite3.hide()
	$AnimatedSprite4.hide()
	$TextureRect.hide()
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept") and finished == true and number == 1:
		load_dialogue(choice)
	if Input.is_action_just_pressed("ui_accept") and finished == true and number == 4:
		load_dialogue(choice2)
	if Input.is_action_just_pressed("ui_accept") and finished == true and number == 7:
		load_dialogue(choice3)
	if Input.is_action_just_pressed("ui_accept") and finished == true and number == 10:
		load_dialogue(choice4)
	if (Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down")) and finished == true and number == 11:
		load_dialogue(choice5)
	if Input.is_action_just_pressed("ui_accept") and finished == true and number == 13:
		load_dialogue2(choice6)
		
		
func load_dialogue(choicenumber):
	yield(get_tree().create_timer(3), "timeout")
	$TextureRect.show()
	$RichTextLabel.show()
	$RichTextLabel2.show()
	$type.play()
	finished = false
	$RichTextLabel.bbcode_text = choicenumber[0]
	$RichTextLabel.percent_visible = 0
	$hhh.interpolate_property(
		$RichTextLabel, "percent_visible", 0, 1, 2, 
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	$hhh.start()
	$type.play()
	finished = false
	$RichTextLabel2.bbcode_text = choicenumber[1]
	$RichTextLabel2.percent_visible = 0
	$hhh.interpolate_property(
		$RichTextLabel2, "percent_visible", 0, 1, 2, 
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	$hhh.start()
	print("adsfdgf")
	
func load_dialogue2(choicenumber):
	yield(get_tree().create_timer(3), "timeout")
	$TextureRect.show()
	$RichTextLabel.hide()
	$RichTextLabel2.hide()
	$type.play()
	finished = false
	$RichTextLabel4.bbcode_text = choicenumber[0]
	$RichTextLabel4.percent_visible = 0
	$aks.interpolate_property(
		$RichTextLabel4, "percent_visible", 0, 1, 2, 
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	$aks.start()
	$RichTextLabel2.hide()
	$AnimatedSprite4.hide()
	
func _on_hhh_tween_completed(_object, _key):
	finished = true
	$type.stop()
	$AnimatedSprite3.show()
	$AnimatedSprite4.show()


func _on_Tween_tween_started(_object, _key):
	$RichTextLabel.hide()
	$RichTextLabel2.hide()
	$AnimatedSprite3.hide()
	$AnimatedSprite4.hide()
	$TextureRect.hide()
	$RichTextLabel4.hide()
	finished = false
	
func _on_Tween_tween_completed(_object, _key):
	finished = true
	number += 1

func _on_hhh_tween_started(_object, _key):
	$RichTextLabel.show()
	$RichTextLabel2.show()

func _on_aks_tween_started(object, key):
	$RichTextLabel4.show()


func _on_aks_tween_completed(object, key):
	$AnimatedSprite3.show()
	finished = true
	$type.stop()

