extends KinematicBody2D

func _ready():
	$AnimatedSprite.play("default")
	set_physics_process(true)
	
export var speed = 5000
var motion = Vector2()

var moving = false
var animPlayer
var movement
var speedMultiplier = 8

func _physics_process(delta):

	ApplyMovement(delta)



func ApplyMovement(deltaTime):
	var LEFT = Input.is_action_pressed("ui_left")
	var RIGHT = Input.is_action_pressed("ui_right")
	var UP = Input.is_action_pressed("ui_up")	
	var DOWN = Input.is_action_pressed("ui_down")

	if LEFT:
		motion.x -= speed * deltaTime
		moving = true
		$AnimatedSprite.flip_h= false
		CheckMovementLoop()

	elif RIGHT:
		motion.x += speed * deltaTime
		moving = true
		$AnimatedSprite.flip_h =true
		CheckMovementLoop()

	elif UP:
		motion.y -= speed * deltaTime
		moving = true
		CheckMovementLoop()

	elif DOWN:
		motion.y += speed * deltaTime
		moving = true
		CheckMovementLoop()

	elif !LEFT or !RIGHT or  !UP or !DOWN:
		moving = false
		CheckMovementLoop()

	move_and_slide(motion.normalized() * speed * speedMultiplier * deltaTime)



func CheckMovementLoop():
	if moving:
		if !motion.is_normalized():
			match motion.normalized():
				Vector2.LEFT:
					movement = "Walk_left"
				Vector2.RIGHT:
					movement = "Walk_right"
				Vector2.UP:
					movement = "Walk_up"
				Vector2.DOWN:
					movement = "Walk_down"

	elif !moving:
		motion.x = 0
		motion.y = 0
		
