extends Control


# Declare member variables here. Examples:
# var a = 2

var dialogue_index = 0
var finished = false

func _ready():
	$continuesprite.hide()
	$TextureRect.hide()
	yield(get_tree().create_timer(1), "timeout")
	load_dialogue()

func _process(_delta):
	$continuesprite.visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		load_dialogue()
		
func load_dialogue():
	$TextureRect.show()
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
	dialogue_index += 1
	
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()
