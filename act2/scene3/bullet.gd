extends Area2D

var speed = 1750
var velocity = Vector2()

func start(pos, dir):
	position = pos
	rotation = dir
	velocity = Vector2(speed, 0).rotated(dir)

func _physics_process(delta):
	position += velocity * delta
func _on_Area2D_body_entered(body):
	if body.name == "player":
		GameOver.transition("res://act2/scene3/scene2.3.tscn")
		GameOver.change(true)
		Transition.change_scene("res://global/gameover/gameOver.tscn")
	queue_free()
