extends Area2D

var dialogue = [
		"IT'S LOCKED . . ."
]
var dialogue_index = 0
var number = 0
var finished = false
var canInteract = false
func _ready():
	$chestLabel.hide()
	$dialoguebox.hide()
	$AnimatedSprite.stop()
func _on_chest_body_entered(body):
	if body.name == "player" and number == 0:
		$chestLabel.show()
		$AnimatedSprite.play("default")
		canInteract = true
func _on_chest_body_exited(body):
	if body.name == "player":
		$chestLabel.hide()
		$AnimatedSprite.stop()
		canInteract = false
func _process(delta):
	$"dialoguebox/continuesprite".visible = finished
	if Input.is_action_just_pressed("ui_accept") and canInteract == true and number == 0:
		$chestLabel.hide()
		load_dialogue()
func load_dialogue():
	$dialoguebox.show()
	$AnimatedSprite.stop()
	if number == 0:
		$Type2.play()
	$dialoguebox/RichTextLabel.bbcode_text = dialogue[dialogue_index]
	$dialoguebox/RichTextLabel.percent_visible = 0
	$dialoguebox/Tween.interpolate_property(
		$dialoguebox/RichTextLabel, "percent_visible", 0, 1, 2, 
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	$dialoguebox/Tween.start()
	if Input.is_action_just_pressed("ui_accept") and finished == true:
		$dialoguebox.hide()
		number += 1
		$Type2.queue_free()
func _on_Tween_tween_completed(_object, _key):
	finished = true
	if number == 0:
		$Type2.stop()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
