extends Node2D

var page = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$Martius.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_right"):
		if page == 0:
			$AudioStreamPlayer.play()
			$Eudaimonia.hide()
			$Martius.show()
			yield(get_tree().create_timer(0.5), "timeout")
			page = 1
			
	if Input.is_action_just_pressed("ui_left"):
		if page == 1:
			$AudioStreamPlayer.play()
			$Eudaimonia.show()
			$Martius.hide()
			yield(get_tree().create_timer(0.5), "timeout")
			page = 0
	if Input.is_action_just_pressed("ui_escape"):
		Transition.change_scene("res://act3/scene2/library")
