extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var path = "text"
var change = false

func _process(delta):
	if change == true:
		$ColorRect.show()
		$AnimatedSprite.show()
		$RichTextLabel.show()
		$AudioStreamPlayer.play()
		
	if change == false:
		$ColorRect.hide()
		$AnimatedSprite.hide()
		$AudioStreamPlayer.stop()
		$RichTextLabel.hide()
		
	if Input.is_action_just_pressed("ui_select") and change == true:
		Transition.change_scene(path)
		yield(get_tree().create_timer(1.5), "timeout")
		change = false
	if Input.is_action_just_pressed("ui_cancel") and change == true:
		Transition.change_scene("res://global/menu/menu.tscn")
		yield(get_tree().create_timer(1.5), "timeout")
		change = false
		
func transition(woa):
	path = woa
	
func change(no):
	yield(get_tree().create_timer(1.5), "timeout")
	change = no
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
