extends Node2D

var page = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.hide()
	$Martius.hide()
	$AnimatedSprite.hide()
	$AnimatedSprite2.hide()
	yield(get_tree().create_timer(3), "timeout")
	$AnimatedSprite.show()
	yield(get_tree().create_timer(10), "timeout")
	$Label.show()
	$Label/AnimationPlayer.play("New Anim")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_right"):
		if page == 0:
			$AnimatedSprite.hide()
			$AudioStreamPlayer.play()
			$Eudaimonia.hide()
			$Martius.show()
			yield(get_tree().create_timer(0.5), "timeout")
			page = 1
			yield(get_tree().create_timer(3), "timeout")
			$AnimatedSprite2.show()
			
	if Input.is_action_just_pressed("ui_left"):
		if page == 1:
			$AnimatedSprite2.hide()
			$AudioStreamPlayer.play()
			$Eudaimonia.show()
			$Martius.hide()
			yield(get_tree().create_timer(0.5), "timeout")
			page = 0
			yield(get_tree().create_timer(3), "timeout")
			$AnimatedSprite.show()
			
	if Input.is_action_just_pressed("ui_cancel"):
		Transition.change_scene("res://act3/scene2/library3.tscn")
