extends Area2D

var canInteract = false
func _ready():
	$Label2.hide()
#	$Label.hide()
func _on_doortime2_body_entered(body):
	if body.name == "player":
		$Label2.show()
		yield(get_tree().create_timer(0.2), "timeout")
#		$Label.show()
		canInteract = true
func _on_doortime2_body_exited(body):
	if body.name == "player":
	#	$Label.hide()
		yield(get_tree().create_timer(0.2), "timeout")
		$Label2.hide()
		canInteract = false

func _input(event):
	if Input.is_action_just_pressed("ui_accept") and canInteract == true:
		Transition.change_scene("res://Act1/cutscenes/scene3/peek.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
