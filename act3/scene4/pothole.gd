extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	gameSaver.save_game("res://Act3/scene4/Scene4Surface.tscn")
	$AnimatedSprite2.hide()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_pothole_body_entered(body):
	if body.name == "player":
		$AnimatedSprite.play("default")
		$AnimatedSprite2.show()
		

func _on_pothole_body_exited(body):
	if body.name == "player":
		$AnimatedSprite.stop()
		$AnimatedSprite2.hide()
		
func _input(event):
	if Input.is_action_pressed("ui_down"):
			Transition.change_scene("res://Act3/scene4/sewerEntrance.tscn")
		
