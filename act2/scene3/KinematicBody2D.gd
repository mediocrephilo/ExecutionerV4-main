extends KinematicBody2D

export (int) var detect_radius 
var fire_rate = 0.3
export (PackedScene) var Bullet
var target
var canShoot = true
var vis_color = Color(.867, .91, .247, 0.1)

func _ready():
	var shape = CircleShape2D.new()
	shape.radius = detect_radius
	$visibility/CollisionShape2D.shape = shape
	$Timer.wait_time = fire_rate
	
func _physics_process(delta):
	update()
	if target:
		rotation = (target.position - position).angle() +600
		if canShoot:
			shoot(target.position)
			#hoot(target.position)
			#shoot(target.position)
			
func shoot(pos):
	var b = Bullet.instance()
	var a = (pos - global_position).angle() + 500
	b.start(global_position, a + rand_range(-0.05, 0.05))
	get_parent().add_child(b)
	canShoot = false
	$Timer.start()

func _draw():
	draw_circle(Vector2(), detect_radius, vis_color)

func _on_Timer_timeout():
	canShoot = true

func _on_visibility_body_entered(body):
	if body.name == "player":
		target = body


func _on_visibility_body_exited(body):
	if body.name == "player":
		if body == target:
			target = null

