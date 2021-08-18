extends ParallaxBackground

func _process(delta):
	$ParallaxLayer/Sprite.position.x -= 2000 * delta

