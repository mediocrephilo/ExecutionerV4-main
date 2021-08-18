extends KinematicBody2D


const ACCEL = 100
const MAXSPEED = 600
const UP = Vector2(0, -1)
var motion = Vector2()

func _process(_delta):
	$AnimatedSprite.hide()
	if Input.is_action_just_pressed("ui_up"):
		$AnimatedSprite.hide()
	
func _physics_process(_delta):
		
	if Input.is_action_pressed("ui_right"):
		motion.x += ACCEL
		if motion.x > MAXSPEED:
			motion.x = MAXSPEED
		
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCEL, -MAXSPEED)
		
	else:
		motion.x = 0
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -2100

	move_and_slide(motion, UP)

func _on_jump_body_entered(body):
	if body.name == "player":
		$AnimatedSprite.show()

func _on_jump_body_exited(body):
	if body.name == "player":
		$AnimatedSprite.hide()
