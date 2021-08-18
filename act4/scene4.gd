extends Node2D

func _process(delta):
	$blocks.position.x -= 700 * delta
	$collisions.position.x -= 700 * delta
