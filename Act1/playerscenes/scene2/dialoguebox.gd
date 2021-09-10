extends Control


# Declare member variables here. Examples:
# var a = 2

var canInteract = false
var dialogue = [
	"THERE'S A DIARY HERE",
	"MUST BE HER'S...",
	"LET'S SEE WHAT'S INSIDE",
]
var dialogue_index = 0
var number = 0
var finished = false
func _ready():
	$TextureRect.hide()
	$RichTextLabel.hide()
	$continuesprite.hide()
func _on_chair_body_entered(body):
	if body.name == "player":
		canInteract = true
func _on_chair_body_exited(body):
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
	$continuesprite.show()
	dialogue_index +=1

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
