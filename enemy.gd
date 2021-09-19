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
	
	


func _on_Area2D_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act4/scene1/act4scene1.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")
