extends KinematicBody2D

onready var anim = $AnimationPlayer
onready var timer = $Timer
var velocity = Vector2()
var triggered = false

func _ready():
	set_physics_process(false)

func _physics_process(delta):
	velocity.y += 6000*delta
	position += velocity * delta
	
func _on_AnimationPlayer_animation_finished(anim_name):
	set_physics_process(true)
	

func collide_with(collision: KinematicCollision2D, collider: KinematicBody2D ):
	if !triggered:
		triggered = true
		anim.play("shake")
		velocity = Vector2.ZERO



func _on_Timer_timeout():
	pass # Replace with function body.
