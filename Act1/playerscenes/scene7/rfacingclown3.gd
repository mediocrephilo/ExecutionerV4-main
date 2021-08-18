extends Area2D

func _ready():
	$rock/Sprite.hide()
	$rock1/Sprite.hide()
	$rock2/Sprite.hide()
	$rock3/Sprite.hide()
	$rock2/CollisionShape2D.disabled = true
	$rock1/CollisionShape2D.disabled = true
	$rrock.hide()
	$rrock1.hide()
	$rrock2.hide()
	$rrock3.hide()



func _on_rfacingclown_body_entered(body):
	if body.name == "player":
		$rock2/CollisionShape2D.set_deferred("disabled", false)
		$rock1/CollisionShape2D.set_deferred("disabled", false)
		$rock/Sprite.show()
		$rock1/Sprite.show()
		$rock2/Sprite.show()
		$rock3/Sprite.show()
		#$rrock/CollisionShape2D.disabled = false
		$rrock.show()
		$rrock1.show()
		$rrock2.show()
		$rrock3.show()

