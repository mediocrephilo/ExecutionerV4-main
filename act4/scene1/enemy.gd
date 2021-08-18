extends KinematicBody2D

const GRAVITY = 10
const SPEED = 250
const FLOOR = Vector2(0,-1)
var velocity = Vector2()
var dir = -1

func _ready():
	pass
func _physics_process(delta):
	velocity.x = SPEED * dir
	if dir ==-1:
		$AnimatedSprite.flip_h = false	
	else:
		$AnimatedSprite.flip_h = true
	$AnimatedSprite.play("default")
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity, FLOOR)
	
	if is_on_wall():
		dir = dir * -1
		$RayCast2D.position.x *= -1
 
	if $RayCast2D.is_colliding() == false:
		dir = dir * -1
		$RayCast2D.position.x *= -1
	
	
