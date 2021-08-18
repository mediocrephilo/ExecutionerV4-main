extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite3.play("patty")
	yield(get_tree().create_timer(1), "timeout")
	$ColorRect2/AnimationPlayer.play("fade")
	

func _on_hhhh_tween_started(_object, _key):
	$AnimatedSprite3.play("patty")


func _on_Tween_tween_started(_object, _key):
	$AnimatedSprite3.play("default")
