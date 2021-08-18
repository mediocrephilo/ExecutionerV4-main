extends Area2D

var counter = 1
var codename

func _ready():
	$Sprite.hide()
	$Sprite2.hide()
	$Sprite3.hide()
	$Sprite4.hide()
	$Sprite5.hide()
	$Sprite6.hide()
	$Sprite7.hide()
	$Sprite8.hide()
	$Sprite9.hide()
	$AnimatedSprite.play("default")

func _input(event):
	if event != null:
		if Input.is_key_pressed(KEY_C) and counter == 1:
			$Sprite.show()
			counter +=1
		elif Input.is_key_pressed(KEY_A) and counter == 2:
			$Sprite2.show()
			counter += 1
			$AnimatedSprite.play("default")
		elif Input.is_key_pressed(KEY_S) and counter == 3:
			$Sprite3.show()
			counter+=1
			$AnimatedSprite.play("default")
		elif Input.is_key_pressed(KEY_S) and counter == 4:
			$Sprite4.show()
			counter += 1
			$AnimatedSprite.play("default")
		elif Input.is_key_pressed(KEY_A) and counter == 5:
			$Sprite5.show()
			counter+=1
			$AnimatedSprite.play("default")
		elif Input.is_key_pressed(KEY_N) and counter == 6:
			$Sprite6.show()
			counter += 1
			$AnimatedSprite.play("default")
		elif Input.is_key_pressed(KEY_D) and counter == 7:
			$Sprite7.show()
			counter += 1
			$AnimatedSprite.play("default")
		elif Input.is_key_pressed(KEY_R) and counter == 8:
			$Sprite8.show()
			counter+=1
			$AnimatedSprite.play("default")
		elif Input.is_key_pressed(KEY_A) and counter == 9:
			$Sprite9.show()
			$AnimatedSprite.play("default")
			Transition.change_scene("res://act4/scene5/scene5room10after.tscn")
			print("gjfkdhjgvjwhv")
		elif Input.is_key_pressed(KEY_ESCAPE):
			Transition.change_scene("res://act4/scene5/scene5room10.tscn")
	
		
			
			
		
			
	
			
