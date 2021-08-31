extends Control

 
var dialogue = [
		"IT LOOKS LIKE IT HASN'T BEEN USED IN A LONG TIME... THE SHEETS ARE ALL MOLDY",
]
var dialogue_index = 0
var finished = false

func _ready():
	$continuesprite.hide()
	yield(get_tree().create_timer(1), "timeout")
	load_dialogue()

func _process(delta):
	$"continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		load_dialogue()
	if dialogue_index == 1 and Input.is_action_just_pressed("ui_accept"):
		Transition.change_scene("res://Act1/playerscenes/scenez11/SceneEleven.tscn")
func load_dialogue():
	$Sprite.show()
	$RichTextLabel.show()
	if dialogue_index < dialogue.size():
		finished = false
		$Type.play()
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
	dialogue_index += 1
