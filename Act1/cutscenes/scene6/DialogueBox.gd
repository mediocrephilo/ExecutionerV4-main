extends Control

var dialogue = [
		". . . DO YOU ACKNOWLEDGE YOUR CRIME?",
		"DO YOU REPENT OF YOUR CRIME?",
		"ARE YOU YET ABSOLVED OF GUILT?",
		"THEN, IN THE YEAR XX OF THEIR GLORIOUS REIGN YOU ARE HEREBY RELIEVED OF YOUR SINS. MAY YOU FIND PEACE IN DEATH.",
	
]
var dialogue_index = 0
var canInteract = true
func _ready():
	$"continuesprite".hide()
func _process(delta):
	if canInteract == true:
		if dialogue_index == 0 and Input.is_action_just_pressed("ui_right"):
			load_dialogue();
		elif dialogue_index == 0:
			if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("ui_up"):
				get_tree().change_scene("res://Act1/cutscenes/scene6/Death.tscn")
		if dialogue_index == 1 and Input.is_action_just_pressed("ui_down"):
			load_dialogue();
		elif dialogue_index == 1:
			if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_up"):
				get_tree().change_scene("res://Act1/cutscenes/scene6/Death.tscn")
		if dialogue_index == 2 and Input.is_action_just_pressed("ui_left"):
			load_dialogue();
		elif dialogue_index == 2:
			if Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("ui_up"):
				get_tree().change_scene("res://Act1/cutscenes/scene6/Death.tscn")
		if dialogue_index == 3 and Input.is_action_just_pressed("ui_up"):
			load_dialogue();
		elif dialogue_index == 3:
			if Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("ui_left"):
				get_tree().change_scene("res://Act1/cutscenes/scene6/Death.tscn")
		if dialogue_index == 4 and Input.is_action_just_pressed("ui_accept"):
			Transition.change_scene("res://Act1/playerscenes/scene6/idkwhatscenethisis.tscn")
		if Input.is_action_just_pressed("ui_accept"):
			$RichTextLabel.hide()
			$symbol1.show()
			$Area2D.show()
			$Area2D2.show()
			$Area2D3.show()
func load_dialogue():
	canInteract = false
	$symbol1.hide()
	$Area2D.hide()
	$Area2D2.hide()
	$Area2D3.hide()
	$TextureRect.show()
	$RichTextLabel.show()
	$Type.play()
	$RichTextLabel.bbcode_text = dialogue[dialogue_index]
	$RichTextLabel.percent_visible = 0
	$Tween.interpolate_property(
		$RichTextLabel, "percent_visible", 0, 1, 2,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	$Tween.start()
		
func _on_Tween_tween_completed(object, key):
	canInteract = true
	dialogue_index +=1
	$continuesprite.show()
	$Type.stop()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
