extends KinematicBody2D


const ACCEL = 100
const MAXSPEED = 600
const UP = Vector2(0, -1)
var motion = Vector2()
#onready var box = get_parent().get_node("hand")


func _physics_process(delta):
	
	motion.y += 50
	
	if Input.is_action_just_pressed("ui_right"):
		$Walk.play()
	if Input.is_action_just_pressed("ui_left"):
		$Walk.play()
		
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
		if($playerSprite.animation != "dead"):
			$playerSprite.play("idle")
		$Walk.stop()
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -2100
			$Walk.stop()
	else:
		if motion.y < 0:
			$playerSprite.play("jump")
		else:
			$playerSprite.play("fall")
			$Walk.play()
	move_and_slide(motion, UP)
