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
		$C.hide()
		$Db.hide()
		$Eb.hide()
		$E.hide()
		$F.hide()
		$Gb.hide()
		$G.hide()
		$D.show()
		$c.stop()
		$db.stop()
		$d.play()
		$eb.stop()
		$e.stop()
		$f.stop()
		$gb.stop()
		$g.stop()
	if Input.is_action_just_pressed("four"):
		$C.hide()
		$Db.hide()
		$D.hide()
		$E.hide()
		$F.hide()
		$Gb.hide()
		$G.hide()
		$Eb.show()
		$c.stop()
		$db.stop()
		$d.stop()
		$eb.play()
		$e.stop()
		$f.stop()
		$gb.stop()
		$g.stop()
	if Input.is_action_just_pressed("five"):
		$C.hide()
		$Db.hide()
		$D.hide()
		$Eb.hide()
		$F.hide()
		$Gb.hide()
		$G.hide()
		$E.show()
		$c.stop()
		$db.stop()
		$d.stop()
		$eb.stop()
		$e.play()
		$f.stop()
		$gb.stop()
		$g.stop()
	if Input.is_action_just_pressed("six"):
		$C.hide()
		$Db.hide()
		$D.hide()
		$Eb.hide()
		$E.hide()
		$Gb.hide()
		$G.hide()
		$F.show()
		$c.stop()
		$db.stop()
		$d.stop()
		$eb.stop()
		$e.stop()
		$f.play()
		$gb.stop()
		$g.stop()
	if Input.is_action_just_pressed("seven"):
		$C.hide()
		$Db.hide()
		$D.hide()
		$Eb.hide()
		$E.hide()
		$F.hide()
		$G.hide()
		$Gb.show()		
		$c.stop()
		$db.stop()
		$d.stop()
		$eb.stop()
		$e.stop()
		$f.stop()
		$gb.play()
		$g.stop()
	if Input.is_action_just_pressed("eight"):
		$C.hide()
		$Db.hide()
		$D.hide()
		$Eb.hide()
		$E.hide()
		$F.hide()
		$Gb.hide()
		$G.show()
		$c.stop()
		$db.stop()
		$d.stop()
		$eb.stop()
		$e.stop()
		$f.stop()
		$gb.stop()
		$g.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
