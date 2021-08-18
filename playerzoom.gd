extends KinematicBody2D

#const ACCEL = 100
#const MAXSPEED = 550
const UP = Vector2(0, -1)
var motion = Vector2()

func _physics_process(delta):
	motion.y += 100
	position.x +=15
	$AnimatedSprite.play("walk")
	if Input.is_action_pressed("ui_down"):
		$AnimatedSprite.play("down")

	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -2500
	else:
		if motion.y < 0:
			$AnimatedSprite.play("jump")
	move_and_slide(motion, UP)
	
