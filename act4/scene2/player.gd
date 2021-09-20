extends KinematicBody2D
#const ACCEL = 100
#const MAXSPEED = 550

onready var end = get_parent().get_node("Area2D")

const UP = Vector2(0, -1)
var motion = Vector2()

func _ready():
	$walk.play()

	
	
func _physics_process(delta):
	motion.y += 100
	$AnimatedSprite.play("walk")
	if Input.is_action_pressed("ui_down"):
		$AnimatedSprite.play("down")
		$walk.stop()
		$CollisionShape2D.disabled = true
	if Input.is_action_just_pressed("ui_down"):
		$slide.play()
		
	if Input.is_action_just_released("ui_down"):
		$walk.play()
		$slide.stop()
		$CollisionShape2D.disabled = false
		

	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -2300
	else:
		if motion.y < 0:
			$AnimatedSprite.play("jump")
			$walk.stop()
		else:
			$AnimatedSprite.play("fall")
			$walk.play()
	move_and_slide(motion, UP)
	
	
	

