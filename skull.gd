extends KinematicBody2D

var motion = Vector2.ZERO
var smol = null
var speed = 9000
 
func _physics_process(delta):
	motion = Vector2.ZERO
	
	if smol != null:
		motion = global_position.direction_to(smol.get_global_position() - Vector2(-4000, -4000))*speed 
	else:
		motion = Vector2.ZERO
		
		
	motion = motion.normalized()
	motion = move_and_collide(motion)

func _on_Area2D_body_entered(body):
	if body != self:
		if body.name == "player":
			smol = body
	 
func _on_Area2D_body_exited(body):
	smol = null
