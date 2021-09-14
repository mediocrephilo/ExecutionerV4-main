extends KinematicBody2D
const ACCEL = 100
const MAXSPEED = 550
const UP = Vector2(0, -1)
var motion = Vector2()

func _physics_process(delta):
	
	if Input.is_action_just_pressed("ui_right"):
		$Walk.play()
	if Input.is_action_just_pressed("ui_left"):
		$Walk.play()
		
	motion.y += 50
	$playerSprite.flip_h
	if Input.is_action_pressed("ui_right"):
		$playerSprite.flip_h = false
		motion.x += ACCEL
		if motion.x > MAXSPEED:
			motion.x = MAXSPEED
		$playerSprite.play("walk")
		
	elif Input.is_action_pressed("ui_left"):
		$playerSprite.flip_h = true
		motion.x = max(motion.x - ACCEL, -MAXSPEED)
		$playerSprite.play("walk")
		
	else:
		motion.x = 0
		$playerSprite.play("idle")
		$Walk.stop()
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -2000
			$Walk.stop()
	else:
		if motion.y < 0:
			$playerSprite.play("jump")
		else:
			$playerSprite.play("fall")
			$Walk.play()
	move_and_slide(motion, UP)
	
	
	

