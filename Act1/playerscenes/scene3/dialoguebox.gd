extends Control

var dialogue = [
		"*COUGH*  *COUGH*  *COUGH*",
		"SURPRISINGLY, IT'S EMPTY EXCEPT FOR ALL THE DUST. IS THIS WHERE SHE KEPT HER TEDDY BEAR?"
]
var dialogue_index = 0
var number = 0
var finished = false
var canInteract = false
func _ready():
	$TextureRect.hide()
	$RichTextLabel.hide()
	$continuesprite.hide()
func _on_chest_body_entered(body):
	if body.name == "player" and number == 0:
		canInteract = true
func _on_chest_body_exited(body):
	if body.name == "player":
		canInteract = false

func _input(event):
	$continuesprite.hide()
	if Input.is_action_just_pressed("ui_accept") and canInteract == true:
		load_dialogue()
		
func load_dialogue():
	$TextureRect.show()
	$RichTextLabel.show()
	yield(get_tree().create_timer(0.5), "timeout")
	if dialogue_index < dialogue.size():
		$type.play()
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
	$type.stop()
	$continuesprite.show()
	dialogue_index +=1
