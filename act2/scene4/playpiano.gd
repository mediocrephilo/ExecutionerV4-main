extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var progression = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$normal.show()
	$C.hide()
	$Db.hide()
	$D.hide()
	$Eb.hide()
	$E.hide()
	$F.hide()
	$Gb.hide()
	$G.hide()
	$Ab.hide()
	$A.hide()
	
func _process(delta):
	if progression == 0:
		$AnimatedSprite.show()
	if progression == 8:
		Transition.change_scene("res://act2/scene4/bread2.tscn")
	if Input.is_action_just_pressed("one"):
		if progression == 6:
			progression += 1
		else:
			progression = 0
		$C.show()
		$c.play()
	if Input.is_action_just_released("one"):
		$C.hide()
		$c.stop()
	if Input.is_action_just_pressed("two"):
		progression = 0
		$Db.show()
		$db.play()
	if Input.is_action_just_released("two"):
		$Db.hide()
		$db.stop()
	if Input.is_action_just_pressed("three"):
		if progression == 4 or progression == 7:
			progression += 1
		else:
			progression = 0
		$D.show()
		$d.play()
	if Input.is_action_just_released("three"):
		$D.hide()
		$d.stop()
	if Input.is_action_just_pressed("four"):
		progression = 0
		$Eb.show()
		$eb.play()
	if Input.is_action_just_released("four"):
		$Eb.hide()
		$eb.stop()
	if Input.is_action_just_pressed("five"):
		if progression == 2 or progression == 5:
			progression += 1
		else:
			progression = 0
		$E.show()
		$e.play()
	if Input.is_action_just_released("five"):
		$E.hide()
		$e.stop()
	if Input.is_action_just_pressed("six"):
		if progression == 3:
			progression += 1
		else:
			progression = 0
		$F.show()
		$f.play()
	if Input.is_action_just_released("six"):
		$F.hide()
		$f.stop()
	if Input.is_action_just_pressed("seven"):
		progression = 0
		$Gb.show()		
		$gb.play()
	if Input.is_action_just_released("seven"):
		$Gb.hide()
		$gb.stop()
	if Input.is_action_just_pressed("eight"):
		progression = 0
		$G.show()
		$g.play()
	if Input.is_action_just_released("eight"):
		$G.hide()
		$g.stop()
	if Input.is_action_just_pressed("nine"):
		$AnimatedSprite.hide()
		if progression == 0:
			progression += 1
		else:
			progression = 0
		$Ab.show()
		$ab.play()
	if Input.is_action_just_released("nine"):
		$Ab.hide()
		$ab.stop()
	if Input.is_action_just_pressed("zero"):
		if progression == 1:
			progression += 1
		else:
			progression = 0
		$A.show()
		$a.play()
	if Input.is_action_just_released("zero"):
		$A.hide()
		$a.stop()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
