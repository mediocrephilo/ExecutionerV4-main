extends KinematicBody2D


var moveSpeed = 1000.0
var pushSpeed =1000.0

func _ready():
	$AnimatedSprite.play("default")
func _physics_process(delta:float) -> void:
	var motion = Vector2()
	motion.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	motion.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	updateAnim(motion)
	move_and_slide(motion.normalized() * moveSpeed, Vector2())
	
	if get_slide_count()>0:
		checkCollision(motion)
		
func updateAnim(motion: Vector2) -> void:
	if motion.x >0:
		$AnimatedSprite.flip_h= true
	if motion.x <0:
		$AnimatedSprite.flip_h = false
	
func checkCollision(motion: Vector2)->void:
	if abs(motion.x) + abs(motion.y) >1:
		return
	var bbox := get_slide_collision(0).collider as BluBox
	if bbox:
		bbox.push(pushSpeed * motion)
	
	var Gbox := get_slide_collision(0).collider as GrenBox
	if Gbox:
		Gbox.push(pushSpeed * motion)
		
	var Rbox := get_slide_collision(0).collider as ReBox
	if Rbox:
		Rbox.push(pushSpeed * motion)
		
	
	

