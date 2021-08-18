extends Area2D


var dialogue = [
		"THE LOCK'S RUSTED SHUT . . . I SHOULD FIND ANOTHER WAY IN."
]
var dialogue_index = 0
var number = 0
var finished = false
var canInteract = false
func _ready():
	$CanvasLayer/dialoguebox.hide()
	$jaildoor2.hide()
func _on_jaildoor2_body_entered(body):
	if body.name == "player" and number == 0:
		$jaildoor2.show()
		$jaildoor2.play("default")
		canInteract = true
func _on_jaildoor2_body_exited(body):
	if body.name == "player":
		$jaildoor2.hide()
		canInteract = false
func _process(delta):
	$CanvasLayer/dialoguebox/continuesprite.visible = finished
	if Input.is_action_just_pressed("ui_accept") and canInteract == true and number == 0:
		load_dialogue()
func load_dialogue():
	$CanvasLayer/dialoguebox.show()
	$jaildoor2.stop()
	if number == 0:
		$Type.play()
	$CanvasLayer/dialoguebox/RichTextLabel.bbcode_text = dialogue[dialogue_index]
	$CanvasLayer/dialoguebox/RichTextLabel.percent_visible = 0
	$CanvasLayer/dialoguebox/Tween.interpolate_property(
		$CanvasLayer/dialoguebox/RichTextLabel, "percent_visible", 0, 1, 2, 
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	$CanvasLayer/dialoguebox/Tween.start()
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		$CanvasLayer/dialoguebox.hide()
		number += 1
		$Type.queue_free()
func _on_Tween_tween_completed(_object, _key):
	finished = true
	if number == 0:
		$Type.stop()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
