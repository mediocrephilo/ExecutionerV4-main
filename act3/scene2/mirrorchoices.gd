extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dialogue = [
#<<<<<<< HEAD
#=======
		". . . IT'S GROWN OVER MY EYES AGAIN.",
		"THE LAST TIME I GOT IT CUT . . .",
		"IT WAS BECAUSE SHE TOLD ME TO.",
		"SHE ALWAYS SAID SHE DIDN'T LIKE IT WHEN I COVERED MY EYES.",
		"SHE WANTED TO SEE THEM, AND TO SEE HERSELF IN THEM.",
		"MAYBE IT WAS TO REMIND HER THAT WE WERE STILL ALIVE.",
		". . .",
		". . . IT'S FUNNY. IT'S SO GROWN LONG I CAN'T SEE CLEARLY ANYMORE."
#>>>>>>> f0599f3fa4c9156509b07ab3f949457bf47c4d97
]
var dialogue_index = 0
var finished = false
var interact = false

func _ready():
	$dialoguebox/Sprite.hide()
	$AnimatedSprite.play("frame")
	$dialoguebox/TextureRect.hide()
	yield(get_tree().create_timer(1), "timeout")
	load_dialogue()

func _process(_delta):
	$dialoguebox/Sprite.visible = finished
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		load_dialogue()
		
func load_dialogue():
	$dialoguebox/TextureRect.show()
	yield(get_tree().create_timer(0.5), "timeout")
	if dialogue_index < dialogue.size():

		$dialoguebox/Type.play()
		finished = false
		$dialoguebox/RichTextLabel.bbcode_text = dialogue[dialogue_index]
		$dialoguebox/RichTextLabel.percent_visible = 0
		$dialoguebox/Tween.interpolate_property(
			$dialoguebox/RichTextLabel, "percent_visible", 0, 1, 2, 
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$dialoguebox/Tween.start()
		if dialogue_index == 6:
			$AnimatedSprite.play("scary")
	else:
		queue_free()


func _on_Tween_tween_completed(object, key):
	finished = true
	$dialoguebox/Type.stop()
	dialogue_index +=1



func _on_Node2D_tree_exited():
	Transition.change_scene("res://act3/scene2/bathroom2.tscn")
