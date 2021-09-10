extends Area2D


var dialogue = [
		"THERE'S AN OLD LOCK ON THE BARS . . . I MIGHT BE ABLE TO PICK IT."
]
var dialogue_index = 0
var number = 0
var finished = false
var canInteract = false
func _ready():
	$Label.hide()
	$CanvasLayer/dialoguebox.hide()
	$jaildoor1.hide()
func _on_jaildoor1_body_entered(body):
	if body.name == "player":
		$jaildoor1.show()
		$jaildoor1.play("default")
		canInteract = true
func _on_jaildoor1_body_exited(body):
	if body.name == "player":
		$jaildoor1.hide()
		$Label.hide()
		canInteract = false
func _process(delta):
	$CanvasLayer/dialoguebox/continuesprite.visible = finished
	if Input.is_action_just_pressed("ui_accept") and canInteract == true and number == 0:
		load_dialogue()
	elif Input.is_action_just_pressed("ui_accept") and canInteract == true and number == 1:
		Transition.change_scene("res://Act1/playerscenes/scenez10/SceneTenPuzzleOne.tscn")
func load_dialogue():
	$CanvasLayer/dialoguebox.show()
	$jaildoor1.stop()
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
		$Label.show()
		$CanvasLayer/dialoguebox.hide()
		number += 1
		$Type.queue_free()
		$jaildoor1.play("default")
		$Label.text = "pick the lock"
func _on_Tween_tween_completed(_object, _key):
	finished = true
	if number == 0:
		$Type.stop()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
