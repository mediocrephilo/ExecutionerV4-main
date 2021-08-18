extends KinematicBody2D

signal ground_update(is_ground)

const ACCEL = 100
const MAXSPEED = 1100
const UP = Vector2(0, -1)
var motion = Vector2()
var is_ground

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
	var was_ground = is_ground
	is_ground = is_on_floor()
	if was_ground == null || is_ground != was_ground:
		emit_signal("ground_update", is_ground)
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.has_method("collide_with"):
			collision.collider.collide_with(collision, self)

#func _on_Area2D_body_entered(body):
	#if body.name == "player":
		#gameOver.transition("res://Act1/playerscenes/scene5/scene5.tscn")
