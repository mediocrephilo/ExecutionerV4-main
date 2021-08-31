extends Control
var dialogue = [
		"So that's why . . . and to think I had forgotten . . . ideals make fools of us all.",
		"Thank you. I don't know how, or why you can see into my past, but thank you for letting me remember.",
		"But, for some reason, I feel that I will have more questions than answers by the end of this.",
		"Let's not think about that for now. Where should we go next?",
#>>>>>>> f0599f3fa4c9156509b07ab3f949457bf47c4d97
]

var dialogue_index = 0
var number = 0
var finished = true
var canInteract = false

func _ready():
	$TextureRect.hide()
	$RichTextLabel.hide()
	$continuesprite.hide()

func _on_paris_body_entered(body):
	if body.name == "player" and number == 0:
		canInteract = true

func _on_paris_body_exited(body):
	if body.name == "player":
		canInteract = false
		
func _process(_delta):
	$"continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		load_dialogue()
		
func load_dialogue():
	$TextureRect.show()
	$RichTextLabel.show()
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
	
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$Type.stop()
	dialogue_index +=1
