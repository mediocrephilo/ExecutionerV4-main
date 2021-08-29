extends Control


var dialogue = [
		"There's something stuck to the bottom of the tub.",
		"The one you just drained the blood out of.",
		"Why don't you reach in and pick it up?",
		"I've never been so glad to be incorporeal.",
]
var dialogue_index = 0
var number = 0
var finished = false
var canInteract = false
func _ready():
	$TextureRect.hide()
	$RichTextLabel.hide()

func _on_tub_body_entered(body):
	if body.name == "player" and number == 0:
		canInteract = true

func _on_tub_body_exited(body):
	if body.name == "player":
		canInteract = false

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and canInteract == true:
		load_dialogue()
	if number == 1 and Input.is_action_just_pressed("ui_accept") and finished == true:
		Transition.change_scene("act3/scene2/bathtub.tscn")
		
func load_dialogue():
	$TextureRect.show()
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

