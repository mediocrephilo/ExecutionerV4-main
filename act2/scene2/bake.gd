extends Area2D

var dialogue = [
		". . .",
		"I FEEL LIKE I'VE BEEN HIT BY A SEMI. HAVE I BEEN HERE BEFORE?",
		"OH ATLAS . . . I THINK I KNOW WHAT'S GOING ON HERE . . . KID? YOU HERE?",
]
var dialogue_index = 0
var number = 0
var finished = false
var canInteract = false
func _ready():
	$dialoguebox/RichTextLabel.hide()
	$dialoguebox/TextureRect.hide()
	$dialoguebox/continuesprite.hide()

func _on_bake_body_entered(body):
	if body.name == "player":
		$AnimatedSprite.play("default")
		canInteract = true;

func _on_bake_body_exited(body):
	if body.name == "player":
		$AnimatedSprite.stop()
		canInteract = false;
		
func _process(_delta):
	$"dialoguebox/continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and canInteract == true and dialogue_index < 2:
		load_dialogue()
	if Input.is_action_just_pressed("ui_accept") and dialogue_index >= 2:
		$dialoguebox/RichTextLabel.hide()
		$dialoguebox/TextureRect.hide()
		$dialoguebox/continuesprite.hide()
		$dialoguebox/Type.stop()
		
func load_dialogue():
	finished = false;
	$dialoguebox/RichTextLabel.show()
	$dialoguebox/TextureRect.show()
	$dialoguebox/Type.play()
	$dialoguebox/RichTextLabel.bbcode_text = dialogue[dialogue_index]
	$dialoguebox/RichTextLabel.percent_visible = 0
	$dialoguebox/Tween.interpolate_property(
		$dialoguebox/RichTextLabel, "percent_visible", 0, 1, 2, 
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	$dialoguebox/Tween.start()
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		$dialoguebox/RichTextLabel.hide()
		$dialoguebox/TextureRect.hide()
		$dialoguebox/continuesprite.hide()
func _on_Tween_tween_completed(_object, _key):
	finished = true
	$dialoguebox/Type.stop()
	dialogue_index += 1
