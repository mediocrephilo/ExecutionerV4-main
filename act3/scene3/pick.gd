extends RigidBody2D

var pick = false

func _ready():
	$Area2D/Label.hide()
func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		var bodies = $Area2D.get_overlapping_bodies()
		for b in bodies:
			if b.name == "player" and pick == false:
				pick = true
				$Area2D/Label.hide()
				$Sprite.hide()
				$CollisionShape2D.disabled = true

func _on_Area2D_body_entered(body):
	if body.name == "player" and pick == false:
		$Area2D/Label.show()


