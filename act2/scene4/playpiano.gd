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
	
func _process(delta):
	if Input.is_action_just_pressed("one"):
		$C.show()
		$c.play()
	if Input.is_action_just_released("one"):
		$C.hide()
		$c.stop()
	if Input.is_action_just_pressed("two"):
		$Db.show()
		$db.play()
	if Input.is_action_just_released("two"):
		$Db.hide()
		$db.stop()
	if Input.is_action_just_pressed("three"):
		$D.show()
		$d.play()
	if Input.is_action_just_released("three"):
		$D.hide()
		$d.stop()
	if Input.is_action_just_pressed("four"):
		$Eb.show()
		$eb.play()
	if Input.is_action_just_released("four"):
		$Eb.hide()
		$eb.stop()
	if Input.is_action_just_pressed("five"):
		$E.show()
		$e.play()
	if Input.is_action_just_released("five"):
		$E.hide()
		$e.stop()
	if Input.is_action_just_pressed("six"):
		$F.show()
		$f.play()
	if Input.is_action_just_released("six"):
		$F.hide()
		$f.stop()
	if Input.is_action_just_pressed("seven"):
		$Gb.show()		
		$gb.play()
	if Input.is_action_just_released("seven"):
		$Gb.hide()
		$gb.stop()
	if Input.is_action_just_pressed("eight"):
		$G.show()
		$g.play()
	if Input.is_action_just_released("eight"):
		$G.hide()
		$g.stop()
	if Input.is_action_just_pressed("nine"):
		$Ab.show()
		$ab.play()
	if Input.is_action_just_released("nine"):
		$Ab.hide()
		$ab.stop()
	if Input.is_action_just_pressed("zero"):
		$A.show()
		$a.play()
	if Input.is_action_just_released("zero"):
		$A.hide()
		$a.stop()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
